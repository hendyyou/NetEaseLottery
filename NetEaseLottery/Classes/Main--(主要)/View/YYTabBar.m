//
//  YYTabBar.m
//  NetEaseLottery
//
//  Created by yuan on 15/12/31.
//  Copyright © 2015年 袁小荣. All rights reserved.
//

#import "YYTabBar.h"
#import "YYTabBarButton.h"


@interface YYTabBar ()
/** 设置当前选中的按钮 */
@property(nonatomic,weak) UIButton *selectedBtn;
@end

@implementation YYTabBar

#pragma mark - 重写items的setter方法
-(void)setItems:(NSArray *)items
{
    _items = items;
    for (UITabBarItem *item in items) {
        
        YYTabBarButton *btn = [YYTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.adjustsImageWhenHighlighted = NO;
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = self.subviews.count;
        [self addSubview:btn];
        
        if (self.subviews.count == 1) {
            [self btnOnClick:btn];
        }
        
    }
}

#pragma mark -  布局子控件的尺寸
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;
    for (NSInteger i = 0; i < count; i++){
        
        UIButton *btn = self.subviews[i];
        
        btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

#pragma mark - TabBar的点击
- (void)btnOnClick:(UIButton *)btn
{
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    // 判断有没有实现代理方法
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtnIndex:)]) {
        [_delegate tabBar:self didClickBtnIndex:btn.tag];
    }
}


@end
