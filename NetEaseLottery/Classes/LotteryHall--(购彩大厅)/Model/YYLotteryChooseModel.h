//
//  YYLotteryChooseModel.h
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYLotteryChooseModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *image;
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
