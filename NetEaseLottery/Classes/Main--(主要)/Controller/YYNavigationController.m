//
//  YYNavigationController.m
//  NetEaseLottery
//
//  Created by yuan on 15/12/31.
//  Copyright © 2015年 袁小荣. All rights reserved.
//

#import "YYNavigationController.h"

@interface YYNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

/** popDelegate */
@property(nonatomic,weak) id popDelegate;

@end

@implementation YYNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.恢复滑动返回功能:清空滑动手势代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    // 2.设置导航控制器的代理,监听导航控制器什么时候回到根控制器
    self.delegate = self;
    
}


#pragma mark -UINavigationControllerDelegate
// 导航控制器显示一个控制器完成的时候就会调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.childViewControllers[0]) {
        // 回到根控制器
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else
    {
        // 不是根控制器
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}


// 不止加载一次

+ (void)initialize
{
    if (self == [YYNavigationController class]) {
        // 在这里设置字体属性
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        // 红色的导航条,全局的
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        
        // 设置字体颜色
        dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
        // 设置字体大小
        dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
        
        // 把包含title属性的字典添加到navBar中
        [navBar setTitleTextAttributes:dictM];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {// 非根控制器
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:0 target:self action:@selector(push)];
        
        // push时隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)push
{
    // pop回前一个控制器
    [self popViewControllerAnimated:YES];
}

#pragma mark - 设置状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
