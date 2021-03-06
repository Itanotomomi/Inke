//
//  JoyLaunchViewController.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyLaunchViewController.h"
#import "LFLivePreview.h"

@interface JoyLaunchViewController ()

@end

@implementation JoyLaunchViewController

- (IBAction)dismissVC:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)startLive:(id)sender {
    
    UIView * back = [[UIView alloc] initWithFrame:self.view.bounds];
    back.backgroundColor = [UIColor blackColor];
    [self.view addSubview:back];
    
    LFLivePreview * liveView = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:liveView];
    [liveView startLive];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
