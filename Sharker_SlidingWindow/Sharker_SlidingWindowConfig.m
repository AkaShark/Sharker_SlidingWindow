//
//  Sharker_SlidingWindowConfig.m
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/17.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "Sharker_SlidingWindowConfig.h"

@implementation Sharker_SlidingWindowConfig
// 创建静态对象 防止外部访问
static Sharker_SlidingWindowConfig *_instance;
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    // 也可以使用一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

+(instancetype)shareConfig
{
    return [[self alloc]init];
}

-(id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}
@end
