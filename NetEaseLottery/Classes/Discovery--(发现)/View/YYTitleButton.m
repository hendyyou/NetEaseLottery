//
//  YYTitleButton.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/5.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYTitleButton.h"

@implementation YYTitleButton

// 修改按钮内部子控件的位置

// 自己的frame一改变,就会调用
// 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 修改按钮内部子控件位置
    if (self.titleLabel.x > self.imageView.x) {
        // 设置label
        self.titleLabel.x = self.imageView.x;
        
        // 设置ImageView
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
        
    }
    
    NSLog(@"titleLabel:%f imageView:%f",self.titleLabel.x,self.imageView.x);
}

// 重写目的,不需要覆盖之前的做法
// 扩充这个方法的功能
- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    // 自动计算尺寸的功能
    // 重新计算按钮的尺寸
    [self sizeToFit];
}

- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
    
}


@end
