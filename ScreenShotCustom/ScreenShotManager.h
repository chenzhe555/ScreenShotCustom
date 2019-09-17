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

#pragma mark 监听截屏
/**
 @brief 监听用户截屏事件
 */
-(void)openScreenShotMonitor:(ActiveScreenShotCallback)callback;

/**
 @brief 关闭监听用户截屏事件
 */
-(void)closeScreenShotMonitor;

#pragma mark 自定义截图事件

/**
 @brief 获取当前屏幕截屏
 */
-(UIImage *)fullScreenShot;

/**
 @brief 生成自定义截图事件

 @param image 截图
 @param rect 尺寸
 @param customView 自定义信息视图(会截取都最后生成的截图中)
 @param handlerView 自定义操作视图(不会截取都最后生成的截图中)
 */
-(void)generateCustomScreenShot:(UIImage *)image rect:(CGRect)rect customView:(UIView *)customView handlerView:(UIView *)handlerView;

/**
 @brief 获取生成的自定义截图
 */
-(UIImage *)generateCustomScreenShotImage;

/**
 @brief 关闭自定义截图视图
 */
-(void)closeCustomScreenShotView;
@end

NS_ASSUME_NONNULL_END
