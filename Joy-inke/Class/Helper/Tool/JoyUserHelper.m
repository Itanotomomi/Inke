//
//  JoyUserHelper.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/26.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyUserHelper.h"

@implementation JoyUserHelper

+ (instancetype)sharedUser {
    
    static JoyUserHelper * userhelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userhelper = [[JoyUserHelper alloc] init];
    });
    return userhelper;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        _iconUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconUrl"];
        
    }
    return self;
}

+ (BOOL)isAutoLogin {
    
    if ([JoyUserHelper sharedUser].username.length == 0) {
        return NO;
    }
    return YES;
}


+ (void)saveUser {
    
    
    [[NSUserDefaults standardUserDefaults] setObject:[JoyUserHelper sharedUser].username forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:[JoyUserHelper sharedUser].iconUrl forKey:@"iconUrl"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
