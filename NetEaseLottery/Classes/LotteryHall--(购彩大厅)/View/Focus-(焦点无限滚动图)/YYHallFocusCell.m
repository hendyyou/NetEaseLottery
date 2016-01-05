//
//  YYHallFocusCell.m
//  NetEaseLottery
//
//  Created by yuan on 16/1/4.
//  Copyright © 2016年 袁小荣. All rights reserved.
//

#import "YYHallFocusCell.h"
#import "YYHallFocusCollectionCell.h"

@interface YYHallFocusCell () <UICollectionViewDelegate,UICollectionViewDataSource>

/** collectionView */
@property(nonatomic,weak) UICollectionView *collectionView;

/** 流水布局 layout */
@property(nonatomic,weak) UICollectionViewFlowLayout *layout;

/** page */
@property(nonatomic,weak) UIPageControl *page;

/** 定时器 */
@property(nonatomic,strong) NSTimer *timer;



@end

// 定义常量
static NSInteger const EnLargeFactor = 10;
static CGFloat const TimerIntervals = 3.0;
static NSString *const YYHallFocusCollectionCellID = @"YYHallFocusCollectionCellID";


@implementation YYHallFocusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // 1.创建一个UICollectionViewFlowLayout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        // 1.1.设置layout的属性
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        // 1.2.关联layout
        _layout = layout;
        
        // 2.创建一个UICollectionView
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        // 2.1.设置collectionView的属性
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled = YES;
        collectionView.showsHorizontalScrollIndicator = NO;
        // 2.2.把collectionView添加到XMGHallFocusCell的contentView上
        [self.contentView addSubview:collectionView];
        // 2.3.关联collectionView
        _collectionView = collectionView;
        
        // 2.4.注册重用cell
        [collectionView registerClass:[YYHallFocusCollectionCell class] forCellWithReuseIdentifier:YYHallFocusCollectionCellID];
        
        // 3.创建页面指示器
        UIPageControl *page = [[UIPageControl alloc]init];
        // 3.1.设置page的属性
        page.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        page.pageIndicatorTintColor = [UIColor whiteColor];
        // 3.2.把page添加到XMGHallFocusCell的contentView上
        [self.contentView addSubview:page];
        // 3.3.关联page
        _page = page;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.调整collectionView的frame
    _collectionView.frame = self.bounds;
    // 2.调整layout的size大小
    _layout.itemSize = self.bounds.size;
    
    // 3.调整页面指示器的位置
    _page.center = CGPointMake(self.center.x, self.center.y + 70);
    
    // 4.将collectionView滚动到最中间
    if (_collectionView.contentOffset.x == 0) {
        NSInteger middle = (self.imagesArray.count * EnLargeFactor)/2;
        NSIndexPath *index = [NSIndexPath indexPathForItem:middle inSection:0];
        [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
}
- (void)setImagesArray:(NSArray *)imagesArray
{
    _imagesArray = imagesArray;
    
    // 设置显示的总页面
    _page.numberOfPages = imagesArray.count;
    // 开启一个定时器
    [self startTimer];
}

#pragma mark - collectionViewDateSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesArray.count * EnLargeFactor;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YYHallFocusCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YYHallFocusCollectionCellID forIndexPath:indexPath];
    
    NSInteger index = indexPath.item % self.imagesArray.count;
    cell.imageView.image = [UIImage imageNamed:self.imagesArray[index]];
    
    return cell;
}
#pragma mark -UIScrollView的Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取collectionView偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    // 获取当前scrollView的偏移值(以屏幕宽度为单位)
    NSInteger index = offsetX/scrollView.frame.size.width;
    
    // 显示当前页数
    _page.currentPage = index % self.imagesArray.count;
}

// 用户将要拖拽scrollView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //停止定时器滚动
    [_timer invalidate];
    _timer = nil;
}
// 用户停止拖拽scrollView
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

#pragma mark - 私有方法
- (void)startTimer
{
    // 让之前的定时器失效并置为空
    [_timer invalidate];
    _timer = nil;
    
    // 1.创建一个定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:TimerIntervals target:self selector:@selector(startAutoScroll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    _timer = timer;
}

#pragma mark - 定时器的监听方法
- (void)startAutoScroll
{
    // 先获取上一张的图片,或则说图片对象的索引
    NSInteger currentIndex = _collectionView.contentOffset.x/_collectionView.frame.size.width;
    
    // 下一张图片
    currentIndex ++;
    
    // 让collectionView滚动到下一张
    if (currentIndex == self.imagesArray.count * EnLargeFactor) { //滚动到最后一张了,下次滚回第一张
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }else{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:currentIndex inSection:0];
        [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}



@end
