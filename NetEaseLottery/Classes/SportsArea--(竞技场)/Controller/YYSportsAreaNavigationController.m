//
//  YYSportsAreaNavigationController.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/5.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYSportsAreaNavigationController.h"

@interface YYSportsAreaNavigationController ()

@end

@implementation YYSportsAreaNavigationController

// 专门来设置竞技场导航条的图片

// 注意:这里因为在XYTabBarController那里统一设置了,所以要去那里判断
+ (void)initialize
{
    if (self == [YYSportsAreaNavigationController class])
    {
        // 设置导航条的图片
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
        
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        
        // 把图片加载到bar上
        [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
}

@end
