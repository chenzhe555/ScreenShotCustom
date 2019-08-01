//
//  ScreenShotManager.h
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ScreenShotCustomView.h"

// 用户主动截屏回调事件 fullScreenImage: 未压缩
typedef void(^ActiveScreenShotCallback)(UIImage * __nullable fullScreenImage);

NS_ASSUME_NONNULL_BEGIN

@interface ScreenShotManager : NSObject
/**
 @brief 获取当前实例
 */
+(instancetype)shareManager;

/**
 @brief 监听用户截屏事件
 */
-(void)openScreenShotMonitor:(ActiveScreenShotCallback)callback;

/**
 @brief 关闭监听用户截屏事件
 */
-(void)closeScreenShotMonitor;

/**
 @brief 获取当前屏幕截屏
 */
-(UIImage *)fullScreenShot;

#pragma mark 自定义截图事件

-(void)generateCustomScreenShot:(UIImage *)image rect:(CGRect)rect customView:(UIView *)customView handlerView:(UIView *)handlerView;

-(UIImage *)generateCustomScreenShotImage;

-(void)closeCustomScreenShotView;
@end

NS_ASSUME_NONNULL_END
