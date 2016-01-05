//
//  YYGroupBuyViewController.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/5.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYGroupBuyViewController.h"

#import "YYTitleButton.h"

@interface YYGroupBuyViewController ()

/** titleButton */
@property(nonatomic,weak) YYTitleButton *titleButton;

@end

@implementation YYGroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setUpNavBar];
    
}

- (void)setUpNavBar
{
    // 默认按钮的图片在左边
    YYTitleButton *titleButton = [YYTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titleButton;
    
    // 文字
    [titleButton setTitle:@"全部采种" forState:UIControlStateNormal];
    
    // image
    [titleButton setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    // 设置导航条titleView
    self.navigationItem.titleView = titleButton;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:0 target:self action:@selector(click)];
}
- (void)click
{
    // 想每次修改按钮的标题,就重新计算下按钮的尺寸
    
    // 修改标题文字
    [_titleButton setTitle:@"你爱我吗" forState:UIControlStateNormal];
    
}


@end
