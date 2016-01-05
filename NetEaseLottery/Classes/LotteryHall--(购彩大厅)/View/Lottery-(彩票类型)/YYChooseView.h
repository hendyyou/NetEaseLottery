//
//  YYChooseView.h
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYChooseView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelSubTitle;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewArrow;

+ (instancetype)viewChoose;

@end
