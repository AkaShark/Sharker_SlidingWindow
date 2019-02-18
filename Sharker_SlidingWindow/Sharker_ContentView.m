//
//  Sharker_ContentView.m
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "Sharker_ContentView.h"

@implementation Sharker_ContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    
}


@end
