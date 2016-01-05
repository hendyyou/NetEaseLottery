//
//  YYSportsAreaView.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/5.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYSportsAreaView.h"

@implementation YYSportsAreaView

// 把图片画出来
- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    
    [image drawInRect:rect];
}

@end
