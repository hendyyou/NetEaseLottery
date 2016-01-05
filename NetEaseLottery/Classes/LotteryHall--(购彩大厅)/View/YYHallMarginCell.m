//
//  YYHallMarginCell.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYHallMarginCell.h"

@implementation YYHallMarginCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.设置cell的背景色
        self.backgroundColor = GlobeColor;
        
        // 2.设置点击样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 3.调整cell的分割线
        self.separatorInset = UIEdgeInsetsZero;
        if ([self respondsToSelector:@selector(layoutMargins)]) {
            self.layoutMargins = UIEdgeInsetsZero;
        }
    }
    return self;
}


@end
