//
//  JoyCacheHelper.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/6.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyCacheHelper.h"

static NSString *const adImageName = @"adImageName";

@implementation JoyCacheHelper

+ (NSString *)getAdvertiseImage {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:adImageName];
}

+ (void)setAdvertiseImage:(NSString *)imageName {
    
    [[NSUserDefaults standardUserDefaults] setObject:imageName forKey:adImageName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
