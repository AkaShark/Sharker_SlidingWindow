//
//  Sharker_SlidingWindowConfig.h
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/17.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

NS_ASSUME_NONNULL_BEGIN

@interface Sharker_SlidingWindowConfig : NSObject

/**
 <#Description#>
 */
@property (nonatomic,copy) NSString *imageName;
/**
 <#Description#>
 */
@property (nonatomic,assign) float imageHight;
/**
 <#Description#>
 */
@property (nonatomic,assign) float residueHeight;

/**
 <#Description#>
 */
@property (nonatomic,assign) float cornerRadius;

/**
 构造方法

 @return self
 */
+(instancetype)shareConfig;

@end

NS_ASSUME_NONNULL_END
