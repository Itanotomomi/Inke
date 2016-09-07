//
//  JoyMainViewController.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyMainViewController.h"
#import "JoyMainTopView.h"

@interface JoyMainViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSArray *titleNames;
@property (nonatomic, strong) JoyMainTopView *topView;

@end

@implementation JoyMainViewController

#pragma mark - setter and getter
- (JoyMainTopView *)topView {
    
    if (!_topView) {
        _topView = [[JoyMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 40) titles:self.titleNames];
        
        @weakify(self);
        _topView.block = ^(NSInteger tag) {
            @strongify(self);
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH, 0);
            [self.contentScrollView setContentOffset:point animated:YES];
        };
    }
    return _topView;
}

- (NSArray *)titleNames {
    
    if (!_titleNames) {
        _titleNames = @[@"关注", @"热门", @"附近"];
    }
    return _titleNames;
}

- (UIScrollView *)contentScrollView {
    
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _contentScrollView.delegate = self;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.showsVerticalScrollIndicator = NO;
        _contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.titleNames.count, 0);
        _contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    }
    return _contentScrollView;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = 0;
    
    [self.view addSubview:self.contentScrollView];
    
    [self createChildController];
    
    [self setupNav];
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
    
}

- (void)createChildController {
    
    NSArray *vcName = @[@"JoyFocusViewController", @"JoyHotViewController", @"JoyNearViewController"];
    
    for (NSInteger i = 0; i < vcName.count; i++) {
        UIViewController *liveVC = [[NSClassFromString(vcName[i]) alloc] init];
        liveVC.title = self.titleNames[i];
#pragma 执行addChildViewController不会调用子类的viewDidLoad
        [self addChildViewController:liveVC];
    }
}

- (void)setupNav {
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStylePlain target:self action:@selector(search:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:self action:@selector(more:)];
}

#pragma mark - scrollView delegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    CGFloat offsetX = self.contentScrollView.contentOffset.x;
    NSInteger index = offsetX / width;
    
    [self.topView scrolling:index];
    
    UIViewController *childVC = self.childViewControllers[index];
    if ([childVC isViewLoaded]) return;
    
    childVC.view.frame = CGRectMake(offsetX, 0, width, height);
    [self.contentScrollView addSubview:childVC.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

#pragma mark - btnClick action
- (void)search:(UIBarButtonItem *)item {
    
}

- (void)more:(UIBarButtonItem *)item {
    
}


@end
