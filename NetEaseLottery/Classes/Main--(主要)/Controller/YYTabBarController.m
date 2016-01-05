//
//  YYTabBarController.m
//  NetEaseLottery
//
//  Created by yuan on 15/12/31.
//  Copyright © 2015年 袁小荣. All rights reserved.
//

#import "YYTabBarController.h"

// 导入五在模块的控制器
#import "YYLotteryHallViewController.h"
#import "YYSportsAreaViewController.h"
#import "YYDiscoveryViewController.h"
#import "YYAwardInfoViewController.h"
#import "YYMyLotteryViewController.h"

#import "YYTabBar.h"
#import "YYNavigationController.h"
#import "YYSportsAreaNavigationController.h"


@interface YYTabBarController ()<YYTabBarDelegate>
/** tabBar的item可变数组 */
@property(nonatomic,strong) NSMutableArray *items;
@end

@implementation YYTabBarController

#pragma mark - 懒加载
- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

#pragma mark - 控制器的view第一次加载的时候会调用
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设设置所有的子控制器
    [self setUPAllChildViewControllers];
    
    // 设置tabBar
    [self setUPTabBar];
}

#pragma mark - 设置所有的子控制器
- (void)setUPAllChildViewControllers
{
    // 购彩大厅
    [self setUPOneChildViewControllers:[[YYLotteryHallViewController alloc] init] image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    // 竞技场
    [self setUPOneChildViewControllers:[[YYSportsAreaViewController alloc] init] image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:@"竞技场"];

    // 发现
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([YYDiscoveryViewController class]) bundle:nil];
    YYDiscoveryViewController *discovery = [storyboard instantiateInitialViewController];
    [self setUPOneChildViewControllers:discovery image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
   
    // 开奖信息
    [self setUPOneChildViewControllers:[[YYAwardInfoViewController alloc] init] image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];

    // 我的彩票
    [self setUPOneChildViewControllers:[[YYMyLotteryViewController alloc] init] image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}

- (void)setUPOneChildViewControllers:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    UINavigationController *nav = [[YYNavigationController alloc] initWithRootViewController:vc];
    
    // 创建竞技场单独的顶部导航条,竞技场,应该使用它自己的导航控制器
    if ([vc isKindOfClass:[YYSportsAreaViewController class]]) {
        nav = [[YYSportsAreaNavigationController alloc] initWithRootViewController:vc];
    }
    
    vc.navigationItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    [self.items addObject:vc.tabBarItem];
    
    
    [self addChildViewController:nav];
    
}

#pragma mark - 设置自定义的tabBar
- (void)setUPTabBar
{
    YYTabBar *tabBar = [[YYTabBar alloc] initWithFrame:self.tabBar.bounds];
    
    tabBar.delegate = self;
    
    tabBar.items = self.items;

    [self.tabBar addSubview:tabBar];
}




#pragma mark - tabBar的view即将显示的时候调用
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    for (UIView *childView in self.tabBar.subviews){
        if (![childView isKindOfClass:[YYTabBar class]])
        {
            [childView removeFromSuperview];
        }
    }
}


#pragma mark - YYTabBarDelegate
- (void)tabBar:(YYTabBar *)tabBar didClickBtnIndex:(NSInteger)index
{
    self.selectedIndex = index;
}



@end
