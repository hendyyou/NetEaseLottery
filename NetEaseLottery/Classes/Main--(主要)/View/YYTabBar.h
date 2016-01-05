//
//  YYTabBar.h
//  NetEaseLottery
//
//  Created by yuan on 15/12/31.
//  Copyright © 2015年 袁小荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYTabBar;
@protocol YYTabBarDelegate <NSObject>

@optional
- (void)tabBar:(YYTabBar *)tabBar didClickBtnIndex:(NSInteger)index;
@end


@interface YYTabBar : UIView

/** items数组,装载tabBar数组 */
@property(nonatomic,strong) NSArray *items;

/** 代理 */
@property(nonatomic,weak) id<YYTabBarDelegate> delegate;

@end
