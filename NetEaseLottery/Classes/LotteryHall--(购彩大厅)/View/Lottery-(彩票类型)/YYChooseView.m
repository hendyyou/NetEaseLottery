//
//  YYChooseView.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYChooseView.h"

@interface YYChooseView ()


+ (instancetype)viewChoose;

@end

@implementation YYChooseView

+ (instancetype)viewChoose
{
    return [[NSBundle mainBundle] loadNibNamed:@"YYChooseView" owner:nil options:nil][0];
}


@end
