//
//  JoyFocusViewController.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyFocusViewController.h"
#import "JoyPlayerViewController.h"
#import "JoyHotLiveCell.h"
#import "JoyCreator.h"

@interface JoyFocusViewController ()

@property (nonatomic, strong) NSMutableArray * dataList;

@end

@implementation JoyFocusViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JoyHotLiveCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"JoyHotLiveCell" owner:self options:nil] lastObject];
    
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 + self.view.bounds.size.width + 10;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JoyPlayerViewController * playerVC = [[JoyPlayerViewController alloc] init];
    playerVC.live = self.dataList[indexPath.row];
    [self.navigationController pushViewController:playerVC animated:YES];
    
}

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    JoyLive * live = [[JoyLive alloc] init];
    JoyCreator * creator = [[JoyCreator alloc] init];
    live.creator = creator;
    
    live.streamAddr = Live_Joy;
    live.city = @"杭州";
    live.onlineUsers = 19386;
    live.creator.nick = @"Joy";
    [self.dataList addObject:live];
    
}


@end
