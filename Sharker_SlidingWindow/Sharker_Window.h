//
//  Sharker_Window.h
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/17.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^scrollViewOffset)(float offset);

@interface Sharker_Window : UIScrollView

@property (nonatomic,copy) scrollViewOffset offsetBlock;


@end

NS_ASSUME_NONNULL_END
