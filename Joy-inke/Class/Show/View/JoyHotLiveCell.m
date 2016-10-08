//
//  JoyHotLiveCell.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/2.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyHotLiveCell.h"

@interface JoyHotLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *portraitImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineUsersLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigPortraitImage;

@end

@implementation JoyHotLiveCell

- (void)setLive:(JoyLive *)live {
    _live = live;
    
    self.titleLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onlineUsersLabel.text = [@(live.onlineUsers) stringValue];
    
    if ([live.creator.nick isEqualToString:@"Joy"]) {
        
        self.portraitImage.image = [UIImage  imageNamed:@"Joy.JPG"];
        self.bigPortraitImage.image = [UIImage  imageNamed:@"Joy.JPG"];
    } else {
        
        [self.portraitImage downloadImage:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, live.creator.portrait] placeholder:@"default_room"];
        [self.bigPortraitImage downloadImage:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, live.creator.portrait] placeholder:@"default_room"];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.portraitImage.layer.cornerRadius = CGRectGetWidth(self.portraitImage.frame) / 2;
    self.portraitImage.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
