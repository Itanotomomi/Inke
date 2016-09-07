//
//  JoyMainTopView.m
//  Joy-inke
//
//  Created by Itanotomomi on 16/9/1.
//  Copyright © 2016年 Itanotomomi. All rights reserved.
//

#import "JoyMainTopView.h"

@interface JoyMainTopView ()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation JoyMainTopView

#pragma mark - setter and getter
- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    
    if (self = [super initWithFrame:frame]) {
        
        for (NSInteger i = 0; i < titles.count; i++) {
            CGFloat btnW = self.width / titles.count;
            CGFloat btnH = self.height;
            CGFloat btnX = btnW * i;
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i;
            [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            titleBtn.frame = CGRectMake(btnX, 0, btnW, btnH);
            [titleBtn.titleLabel sizeToFit];
            [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titleBtn];
            [self.buttons addObject:titleBtn];
            
            // 添加button下划线
            if (i == 1) {
                CGFloat h = 2;
                CGFloat y = frame.size.height - 5;
                
                self.lineView = [[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.top = y;
                self.lineView.width = titleBtn.titleLabel.width;
                self.lineView.centerX = titleBtn.centerX;
                self.lineView.height = h;

                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}

- (void)titleBtnClick:(UIButton *)button {
    
    self.block(button.tag);
    [self scrolling:button.tag];
}

- (void)scrolling:(NSInteger)tag {
    
    UIButton *btn = self.buttons[tag];
    [UIView animateWithDuration:0.2 animations:^{
        self.lineView.centerX = btn.centerX;
    }];
}

@end
