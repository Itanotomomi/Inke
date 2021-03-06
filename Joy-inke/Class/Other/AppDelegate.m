//
//  AppDelegate.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "AppDelegate.h"
#import "JoyBaseTabBarController.h"
#import "JoyAdvertiseView.h"
#import "JoyLocationManager.h"
#import "AppDelegate+UMeung.h"
#import "JoyUserHelper.h"
#import "JoyLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**设置友盟*/
    [self setupUmeng];
    
    UIViewController * mainVC ;
    
    if ([JoyUserHelper isAutoLogin]) {
        
        mainVC = [[JoyBaseTabBarController alloc] init];
        
    } else {
        mainVC = [[JoyLoginViewController alloc] init];
        
    }
    
    self.window.rootViewController = mainVC;
    
    JoyAdvertiseView *advertiseView = [JoyAdvertiseView loadAdvertiseView];
    
    [self.window addSubview:advertiseView];
    
    [[JoyLocationManager sharedManager] getGPS:^(NSString *lat, NSString *lon) {
        
        NSLog(@"%@, %@", lat, lon);
    }];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        /**调用其他SDK，例如支付宝SDK等*/
    }
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
