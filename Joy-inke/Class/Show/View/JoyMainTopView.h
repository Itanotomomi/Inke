//
//  JoyMainTopView.h
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface JoyMainTopView : UIView

@property (nonatomic, copy) MainTopBlock block;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
- (void)scrolling:(NSInteger)tag;

@end
