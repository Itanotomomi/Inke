//
//  JoyUserHelper.h
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/26.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JoyUserHelper : NSObject

+ (instancetype)sharedUser;

@property (nonatomic, copy) NSString * username;

@property (nonatomic, copy) NSString * iconUrl;

+ (BOOL)isAutoLogin;

+ (void)saveUser;

@end
