//
//  JoyNearLiveCell.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/6.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyNearLiveCell.h"

@interface JoyNearLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation JoyNearLiveCell

- (void)showAnimation {
    //x和y的最终值为1
    if (self.live.isShow) {
        return;
    }
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:1 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.live.show = YES;
    }];
}

- (void)setLive:(JoyLive *)live {
    
    _live = live;
    
    [self.headView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    self.distanceLabel.text = live.distance;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
