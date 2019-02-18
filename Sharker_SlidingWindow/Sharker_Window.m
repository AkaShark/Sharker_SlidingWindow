//
//  Sharker_Window.m
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/17.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "Sharker_Window.h"
#import "Sharker_SlidingWindowConfig.h"
#import "Sharker_ContentView.h"

@interface Sharker_Window()<UIScrollViewDelegate>

@end

@implementation Sharker_Window

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        self.delegate = self;
    }
    return self;
}

- (void)setupUI{
    Sharker_SlidingWindowConfig *config = [Sharker_SlidingWindowConfig shareConfig];
    self.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    self.contentOffset = CGPointMake(0, -(config.imageHight-config.residueHeight));
    self.contentInset = UIEdgeInsetsMake((config.imageHight-config.residueHeight), 0, 0, 0);
    self.backgroundColor = UIColor.clearColor;
    self.showsVerticalScrollIndicator = NO;
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    self.bounces = NO;
//    设置内容
    Sharker_ContentView *contentView = [[Sharker_ContentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self addSubview:contentView];
}

#pragma mark- ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y <= 0) {
        if (_offsetBlock)
        {
            _offsetBlock((float)scrollView.contentOffset.y);
        }
    }
    
    
}

@end
