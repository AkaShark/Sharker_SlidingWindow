//
//  ViewController.m
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/17.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "ViewController.h"
#import "Sharker_SlidingWindow.h"
#import "Sharker_SlidingWindowConfig.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    配置
    Sharker_SlidingWindowConfig *config = [Sharker_SlidingWindowConfig shareConfig];
    config.imageName = @"icon_headImage";
    config.imageHight = 300.0;
    config.residueHeight = 100.0;
//    调用
    Sharker_SlidingWindow *slidingWindow = [[Sharker_SlidingWindow alloc]initWitchConfig:config];
    
    [self.view addSubview:slidingWindow];
}


@end
