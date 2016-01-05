//
//  YYLotteryChooseCell.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYLotteryChooseCell.h"

#define kRatio 0.25

@implementation YYLotteryChooseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 0.基本设置
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 0.1调整cell的分割线
        self.separatorInset = UIEdgeInsetsZero;
        if ([self respondsToSelector:@selector(layoutMargins)]) {
            self.layoutMargins = UIEdgeInsetsZero;
        }
        // 1.添加左右两个视图
        // 1.1提那几左边视图
        YYChooseView *left = [YYChooseView viewChoose];
        [self.contentView addSubview:left];
        self.leftView = left;
        
        // 1.2添加右边视图
        YYChooseView *right = [YYChooseView viewChoose];
        [self.contentView addSubview:right];
        self.rightView = right;
        
        // 2.创建分割线
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:line];
        
        self.line = line;
        
        // 3.给左右视图添加监听手势
        UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(handleChooseViewClick:)];
        [self.leftView addGestureRecognizer:tap0];
        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(handleChooseViewClick:)];
        [self.rightView addGestureRecognizer:tap1];
    }
    return self;
}

// 手势监听方法
- (void)handleChooseViewClick:(UITapGestureRecognizer *)gesture
{
    UIView *view = gesture.view;
    // 判断用户是否点击了坐标试图
    BOOL isRight = (view == self.rightView);
    
    if ([self.delegate respondsToSelector:@selector(choossCell:didClickAtRightView:)]) {
        [self.delegate choossCell:self didClickAtRightView:isRight];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width/2;
    CGFloat height = self.frame.size.height;
    
    // 1.调整左右视图的位置
    self.leftView.frame = CGRectMake(0, 0, width, height);
    self.rightView.frame = CGRectMake(width, 0, width, height);
    
    // 2.调整分割线的位置
    self.line.frame = CGRectMake(width, height * kRatio, 0.5, height * (1- kRatio *2));
    
}


@end
