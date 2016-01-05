//
//  YYLotteryChooseCell.h
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYChooseView.h"

@class YYLotteryChooseCell,YYLotteryChooseModel;

@protocol YYLotteryChooseCellDelegate <NSObject>

@optional
- (void)choossCell:(YYLotteryChooseCell *)cell didClickAtRightView:(BOOL)isRight;

@end

@interface YYLotteryChooseCell : UITableViewCell

@property (nonatomic, weak) id<YYLotteryChooseCellDelegate>delegate;

@property (nonatomic, strong) YYChooseView *leftView;
@property (nonatomic, strong) YYChooseView *rightView;

@property (nonatomic, strong) UIView *line;
@property (nonatomic, weak) NSIndexPath *indexPath;

@property (nonatomic, weak) YYLotteryChooseModel *leftModel;
@property (nonatomic, weak) YYLotteryChooseModel *rightModel;

@end
