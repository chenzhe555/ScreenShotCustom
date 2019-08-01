//
//  ScreenShotUtil.h
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScreenShotUtil : NSObject

/**
 @brief 获取当前window
 */
+(UIWindow *)getMainWindow;

/**
 @brief 截屏全屏
 */
+(UIImage *)fullScreenShot;

/**
 @brief 截屏当前屏幕中某块区域
 */
+(UIImage *)screenShotWithRect:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
