//
//  JoyBaseTabBar.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyBaseTabBar.h"

@interface JoyBaseTabBar ()
/**tabbar背景*/
@property (nonatomic, strong) UIImageView *tabbgView;
/**tabbar按钮数据*/
@property (nonatomic, strong) NSArray *dataList;
/**上一个点击按钮*/
@property (nonatomic, strong) UIButton *lastItem;
/**相机按钮*/
@property (nonatomic, strong) UIButton *cameraBtn;

@end

@implementation JoyBaseTabBar

#pragma mark - setter and getter
- (NSArray *)dataList {
    
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

- (UIButton *)cameraBtn {
    
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        _cameraBtn.tag = JoyItemTypeLaunch;
    }
    return _cameraBtn;
}

- (UIImageView *)tabbgView {
    
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 装载背景图片
        [self addSubview:self.tabbgView];
        
        // 装载item
        for (NSInteger i = 0; i < self.dataList.count; i++) {
            
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            item.tag = JoyItemTypeLive + i;
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:item];
            
        }
        
        // 装载相机按钮
        [self addSubview:self.cameraBtn];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat btnWidth = SCREEN_WIDTH / self.dataList.count;
    
    for (UIView *btn in self.subviews) {
        if (btn.tag >= JoyItemTypeLive) {
            btn.frame = CGRectMake((btn.tag - JoyItemTypeLive) * btnWidth, 0, btnWidth, self.frame.size.height);
        }
    }
    
    self.tabbgView.frame = self.frame;
#warning cameraBtn的超出了tabbar,超出部分无法响应事件
    self.cameraBtn.center = CGPointMake(self.center.x, self.center.y - 20);
}

#pragma mark - btnClick action
// 按钮点击事件
- (void)clickItem:(UIButton *)button {
    
    if ([_delegate respondsToSelector:@selector(tabbar:clickIndex:)]) {
        [_delegate tabbar:self clickIndex:button.tag];
    }
    
    if (_block) {
        _block(self, button.tag);
    }
    
    if (button.tag == JoyItemTypeLaunch) return;
    
    // 取消上一个button的选中
    self.lastItem.selected = NO;
    
    // 选中当前button
    button.selected = YES;
    
    // 将当前按钮设置为上一个button
    self.lastItem = button;
    
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            button.transform = CGAffineTransformIdentity;
        }];
    }];
    
}

@end
