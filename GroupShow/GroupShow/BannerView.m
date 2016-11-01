//
//  BannerView.m
//  GroupShow
//
//  Created by MichaelLi on 2016/10/31.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "BannerView.h"

@interface BannerView()<UIScrollViewDelegate>
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIPageControl *pageControl;

@end
@implementation BannerView

-(instancetype )initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupScrollViewUI];
        [self setupPageControlUI];
    }
    return  self;
}
#pragma mark
#pragma mark -  重写imageArray
-(void)setImageArray:(NSArray *)imageArray
{
    //属性赋值
    _imageArray = imageArray;
    NSLog(@"imageArray%lu",(unsigned long)imageArray.count);
    //size
    CGSize size = self.bounds.size;
    for (int i = 0; i < imageArray.count; i++) {

        //设置imageView
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        //取出图片
        NSString *imageNamed = imageArray[i];
        //赋image
        imageView.image = [UIImage imageNamed:imageNamed];
        [self.scrollView addSubview:imageView];
    }
    #warning scrollView是否滚动与contentSize有关
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width*imageArray.count, 0);
    //pageControl.count
    self.pageControl.numberOfPages = imageArray.count;
    self.pageControl.currentPage = 0;
}
#pragma mark
#pragma mark -  设置滚动View
-(void)setupScrollViewUI
{
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];

    //代理
    self.scrollView.delegate = self;
    //隐藏滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //分页模式
    self.scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
}
#pragma mark
#pragma mark -  设置pageControl
-(void)setupPageControlUI
{
    //实例化
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0,0, self.bounds.size.width/2,20)];
    _pageControl.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height*0.9);
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:_pageControl];
    NSLog(@"self%@",self);
}
#pragma mark
#pragma mark -  拖拽后
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"OKOK");
    NSLog(@"self.scrollView.contentOffset.x%f",self.scrollView.contentOffset.x);
    self.pageControl.currentPage = self.scrollView.contentOffset.x/self.scrollView.bounds.size.width;
}
@end
