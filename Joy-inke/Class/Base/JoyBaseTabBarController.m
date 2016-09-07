//
//  JoyBaseTabBarController.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyBaseTabBarController.h"
#import "JoyLaunchViewController.h"
#import "JoyBaseTabBar.h"
#import "JoyBaseNavController.h"

@interface JoyBaseTabBarController () <JoyBaseTabBarDelegate>

@property (nonatomic, strong) JoyBaseTabBar *JoyTabbar;

@end

@implementation JoyBaseTabBarController

#pragma mark - setter and getter 
- (JoyBaseTabBar *)JoyTabbar {
    
    if (!_JoyTabbar) {
        _JoyTabbar = [[JoyBaseTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _JoyTabbar.delegate = self;
    }
    return _JoyTabbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureViewControllers];
    [self.tabBar addSubview:self.JoyTabbar];
    
    // 去除tabBar阴影
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tabbar delegate
- (void)tabbar:(JoyBaseTabBar *)tabbar clickIndex:(JoyItemType)idx {
    
    if (idx != JoyItemTypeLaunch) {
        self.selectedIndex = idx - JoyItemTypeLive;
        return;
    }
    
    JoyLaunchViewController *launchVC = [[JoyLaunchViewController alloc] init];
    [self presentViewController:launchVC animated:YES completion:nil];
}

#pragma mark - create ViewController
- (void)configureViewControllers {
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"JoyMainViewController",@"JoyMeViewController"]];
    
    for (NSInteger i = 0; i < array.count; i++) {
        
        UIViewController *VC = [[NSClassFromString(array[i]) alloc] init];
        
        JoyBaseNavController *Nav = [[JoyBaseNavController alloc] initWithRootViewController:VC];
        
        [array replaceObjectAtIndex:i withObject:Nav];
    }
    
    self.viewControllers = array;
    
}

@end
