//
//  YYMyLotteryViewController.m
//  NetEaseLottery
//
//  Created by yuan on 15/12/31.
//  Copyright © 2015年 袁小荣. All rights reserved.
//

#import "YYMyLotteryViewController.h"

@interface YYMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation YYMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置登录按钮
    [self setLoginButton];
    
    // 设置Nav
    [self setNavBarButtonItem];
    
    
}

- (void)setNavBarButtonItem
{
    // 导航条左边按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [btn sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    
    // 导航条右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:0 target:self action:@selector(setting)];
}

- (void)setting
{
    
}

#pragma mark - 设置不拉伸的登录按钮图片
- (void)setLoginButton
{
    // 获取当前按钮的背景图片
    UIImage *image = _loginButton.currentBackgroundImage;
    
    
    // 设置正常状态下的按钮图片的拉伸效果
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 把拉伸好的图片 重新设置给 _loginButton
    [_loginButton setBackgroundImage:image forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:image forState:UIControlStateHighlighted];
}


@end
