//
//  YYGuessBgCell.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYGuessBgCell.h"

@interface YYGuessBgCell ()



@end

@implementation YYGuessBgCell

+ (NSString *)nibName
{
    return @"YYGuessBgCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.clipsToBounds = YES;
    self.imageViewBg.clipsToBounds = YES;
}


@end
