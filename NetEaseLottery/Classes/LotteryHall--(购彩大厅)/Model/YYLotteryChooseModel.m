//
//  YYLotteryChooseModel.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYLotteryChooseModel.h"

@implementation YYLotteryChooseModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    YYLotteryChooseModel *model = [[self alloc]init];
    
    model.title = dict[@"title"];
    model.subTitle = dict[@"subTitle"];
    model.image = dict[@"image"];
    
    return model;
}

@end
