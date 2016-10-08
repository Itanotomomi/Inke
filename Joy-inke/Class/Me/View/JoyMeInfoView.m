//
//  JoyMeInfoView.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/26.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyMeInfoView.h"

@interface JoyMeInfoView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation JoyMeInfoView

+ (instancetype)loadInfoView {
    
    return  [[[NSBundle mainBundle] loadNibNamed:@"JoyMeInfoView" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImage.layer.cornerRadius = CGRectGetWidth(self.iconImage.frame) / 2;
    self.iconImage.layer.masksToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
