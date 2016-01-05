//
//  YYGuessCell.h
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYGuessCell;

@protocol YYGuessCellDelegate <NSObject>

@optional
- (void)cellDidClickChangeBtn:(YYGuessCell *)cell;

@end

@interface YYGuessCell : UITableViewCell

@property (nonatomic, weak) id<YYGuessCellDelegate>delegate;
+ (NSString *)nibName;

@end
