//
//  YYHallFocusCollectionCell.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYHallFocusCollectionCell.h"

@implementation YYHallFocusCollectionCell

#pragma mark - 设置CollectionViewCell的frame
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]init];
        
        self.imageView.frame  = self.bounds;
        
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

#pragma mark - 调整子数图的大小和位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}


@end
