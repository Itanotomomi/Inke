//
//  JoyAdvertiseView.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/6.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyAdvertiseView.h"
#import "JoyHotLiveHandler.h"
#import "JoyAdvertise.h"
#import "JoyCacheHelper.h"

@interface JoyAdvertiseView ()

@property (weak, nonatomic) IBOutlet UIImageView *backView;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

// 广告显示的时间
static int const showtime = 3;

@implementation JoyAdvertiseView
- (IBAction)dismissButton:(id)sender {
    
    [self dismiss];
}

+ (instancetype)loadAdvertiseView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"JoyAdvertiseView" owner:self options:nil] lastObject];;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.frame = [UIScreen mainScreen].bounds;
    
    // 展示广告
    [self showAdvertise];
    
    // 下载广告
    [self downLoadAdvertise];
    
    // 倒计时
    [self startCoundown];
}

- (void)showAdvertise {
    
    NSString * fileName = [JoyCacheHelper getAdvertiseImage];
    NSString * filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,fileName];
    
    UIImage *lastPreviousCachedImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    if (!lastPreviousCachedImage) {
        self.hidden = YES;
    } else {
        self.backView.image = lastPreviousCachedImage;
    }
}

- (void)downLoadAdvertise {
    
    [JoyHotLiveHandler executeGetAdvertiseWithSuccess:^(id obj) {
        
        JoyAdvertise * ad = obj;
        
        NSURL * imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,ad.image]];
        
        //SDWebImageAvoidAutoSetImage 下载完成不会直接赋值给imageview
        [[SDWebImageManager sharedManager] downloadImageWithURL: imageUrl
                                                        options: SDWebImageAvoidAutoSetImage
                                                       progress: nil
                                                      completed: ^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                          
                                                          [JoyCacheHelper setAdvertiseImage:ad.image];
                                                          
                                                          NSLog(@"图片下载成功");
                                                      }];
        
    } failed:^(id obj) {
        
    }];
}

- (void)startCoundown {
    
    __block int timeout = showtime + 1; //倒计时时间 + 1
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self dismiss];
                
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeLabel.text = [NSString stringWithFormat:@"跳过%d",timeout];
                NSLog(@"keep");
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)dismiss {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

@end