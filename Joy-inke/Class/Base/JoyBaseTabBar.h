//
//  JoyBaseTabBar.h
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JoyItemType) {
    
    JoyItemTypeLaunch = 10,
    JoyItemTypeLive = 100,
    JoyItemTypeMe
    
};

@class JoyBaseTabBar;

typedef void(^TabBlock)(JoyBaseTabBar *tabbar, JoyItemType idx);

@protocol JoyBaseTabBarDelegate <NSObject>

- (void)tabbar:(JoyBaseTabBar *)tabbar clickIndex:(JoyItemType)idx;

@end

@interface JoyBaseTabBar : UIView

@property (nonatomic, weak) id<JoyBaseTabBarDelegate> delegate;
@property (nonatomic, copy) TabBlock block;

@end
