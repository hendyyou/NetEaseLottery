//
//  YYSportsAreaViewController.m
//  NetEaseLottery
//
//  Created by yuan on 15/12/31.
//  Copyright © 2015年 袁小荣. All rights reserved.
//

#import "YYSportsAreaViewController.h"
#import "YYSportsAreaView.h"

@interface YYSportsAreaViewController ()

@end

@implementation YYSportsAreaViewController

- (void)loadView
{
    YYSportsAreaView *sportsArea = [[YYSportsAreaView alloc] init];
    self.view = sportsArea;
}


// 设置选项卡
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建一个选项卡
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    
    // 设置默认选中第0个
    segment.selectedSegmentIndex = 0;
    
    // 设置选项卡正常情况下的图片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    // 设置选项卡选中情况下的图片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    
    // 设置选项卡的选中文字的颜色
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    
    // 设置主题颜色
    segment.tintColor = [UIColor colorWithRed:0/255.0 green:142/255.0 blue:143/255.0 alpha:1];
    
    self.navigationItem.titleView = segment;
    
}

@end
