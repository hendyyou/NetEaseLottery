//
//  YYGuessCell.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYGuessCell.h"

@implementation YYGuessCell

+ (NSString *)nibName
{
    return @"YYGuessCell";
}

- (IBAction)changeBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(cellDidClickChangeBtn:)]) {
        [self.delegate cellDidClickChangeBtn:self];
    }
}


@end
