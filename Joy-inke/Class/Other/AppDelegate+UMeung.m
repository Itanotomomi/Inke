//
//  AppDelegate+UMeung.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/26.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "AppDelegate+UMeung.h"

@implementation AppDelegate (UMeung)

- (void)setupUmeng {
    
    //设置umengkey
    [UMSocialData setAppKey:@"57e8aa8667e58ef643002b99"];
    //RedirectURL 授权回调页
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"1353767123"
                                              secret:@"55c6a09b7fd4aca46433b5d765674ebb"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

@end
