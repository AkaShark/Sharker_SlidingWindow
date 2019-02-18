//
//  Sharker_SlidingWindow.m
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/17.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "Sharker_SlidingWindow.h"
#import "Sharker_SlidingWindowConfig.h"
#import "Sharker_Window.h"



@interface Sharker_SlidingWindow()
@property (nonatomic,strong) Sharker_SlidingWindowConfig *slidingWindowConfig;
@property (nonatomic,strong) Sharker_Window *slidingWindow;
@end

@implementation Sharker_SlidingWindow

- (instancetype)initWitchConfig:(Sharker_SlidingWindowConfig *)config{
    self = [super init];
    if (self) {
        _slidingWindowConfig = config;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
//    headImage
    UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, _slidingWindowConfig.imageHight)];
    headImageView.image = [UIImage imageNamed:_slidingWindowConfig.imageName];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(returnTop)];
    [headImageView addGestureRecognizer:tap];
    headImageView.userInteractionEnabled = YES;
    [self addSubview:headImageView];
    
//    effect
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *HUDView = [[UIVisualEffectView alloc] initWithEffect:blur];
    HUDView.frame = CGRectMake(0, 0, kScreenWidth, _slidingWindowConfig.imageHight);
    HUDView.alpha = 0;
    HUDView.userInteractionEnabled = NO;
    [headImageView addSubview:HUDView];
    
//    设置下半部分的滑动Window
    _slidingWindow = [[Sharker_Window alloc] initWithFrame:CGRectMake(0,_slidingWindowConfig.residueHeight-15, kScreenWidth, kScreenHeight)];
    
    _slidingWindow.offsetBlock = ^(float offset) {
        Sharker_SlidingWindowConfig *config = [Sharker_SlidingWindowConfig shareConfig];
        float maxLen = config.imageHight - config.residueHeight;
        float percent = (-offset)/maxLen;
        HUDView.alpha = 1-percent;
    };
    [self addSubview:_slidingWindow];
}

// 点击图片返回顶部
- (void)returnTop{
    __weak __typeof__(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
       weakSelf.slidingWindow.contentOffset = CGPointMake(0, -(weakSelf.slidingWindowConfig.imageHight-weakSelf.slidingWindowConfig.residueHeight));
    }];
}

@end
