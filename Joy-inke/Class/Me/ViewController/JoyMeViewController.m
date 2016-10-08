//
//  JoyMeViewController.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyMeViewController.h"
#import "JoyMeInfoView.h"

@interface JoyMeViewController ()

@property (nonatomic, strong) NSArray * datalist;

@property (nonatomic, strong) JoyMeInfoView * infoView;

@end

@implementation JoyMeViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (JoyMeInfoView *)infoView {
    
    if (!_infoView) {
        _infoView = [JoyMeInfoView loadInfoView];
        _infoView.frame = CGRectMake(0, 0, 0, SCREEN_HEIGHT * 0.3);
    }
    return _infoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(94, 242, 231);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.view.size.width, self.view.size.height * 0.5);
    self.infoView.size = CGSizeMake(self.view.size.width, self.view.size.height * 0.5);
    self.tableView.tableHeaderView = self.infoView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    // Configure the cell...
    
    
    return cell;
}

@end
