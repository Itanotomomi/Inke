//
//  JoyNearLiveCell.h
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/6.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JoyLive.h"

@interface JoyNearLiveCell : UICollectionViewCell

@property (nonatomic, strong) JoyLive * live;

- (void)showAnimation;

@end
