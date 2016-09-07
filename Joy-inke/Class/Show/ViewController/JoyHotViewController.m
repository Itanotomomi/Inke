//
//  JoyHotViewController.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyHotViewController.h"
#import "JoyHotLiveHandler.h"
#import "JoyHotLiveCell.h"
#import "JoyPlayerViewController.h"

static NSString * identifier = @"JoyHotLiveCell";

@interface JoyHotViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * dataList;

@end

@implementation JoyHotViewController

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

#pragma mark - scrollView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JoyHotLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.live = self.dataList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 + self.view.bounds.size.width + 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JoyPlayerViewController *playerVC = [[JoyPlayerViewController alloc] init];
    playerVC.live = self.dataList[indexPath.row];
    
    [self.navigationController pushViewController:playerVC animated:YES];
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 113, 0);
    
    [self initUI];
    
    [self loadData];
}

- (void)initUI {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JoyHotLiveCell" bundle:nil] forCellReuseIdentifier:identifier];
}

- (void)loadData {
    
    [JoyHotLiveHandler executeGetHotLiveTaskWithPage:0 success:^(id obj) {
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
    } failed:^(id obj) {
        NSLog(@"%@",obj);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
