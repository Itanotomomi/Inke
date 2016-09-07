//
//  JoyNearViewController.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyNearViewController.h"
#import "JoyHotLiveHandler.h"
#import "JoyNearLiveCell.h"
#import "JoyPlayerViewController.h"

#define kItemSizeW 100
#define kMargin 5

static NSString * identifier = @"SXTNearLiveCell";
@interface JoyNearViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray * dataList;

@end

@implementation JoyNearViewController

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        
    CGFloat outInset = self.view.width - 2 * kMargin;
    NSInteger count = outInset / kItemSizeW;
    NSInteger itemWH = (NSInteger)((outInset - kMargin * (count + 1)) / count);
    
    return CGSizeMake(itemWH, itemWH + 25);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JoyNearLiveCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JoyPlayerViewController * playerVC = [[JoyPlayerViewController alloc] init];
    
    playerVC.live = self.dataList[indexPath.row];
    
    [self.navigationController pushViewController:playerVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JoyNearLiveCell * c = (JoyNearLiveCell *)cell;
    [c showAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JoyNearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
    [self loadData];
    
}

- (void)loadData {
    
    [JoyHotLiveHandler executeNearLiveTaskWithSuccess:^(id obj) {
        
        self.dataList = obj;
        [self.collectionView reloadData];
        
    } failed:^(id obj) {
        
        NSLog(@"%@",obj);
    }];
}
@end
