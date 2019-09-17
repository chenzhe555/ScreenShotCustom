//
//  ScreenShotCustomView.h
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScreenShotCustomView : UIView

/**
 @brief 生成自定义截图事件
 
 @param image 截图
 @param rect 尺寸
 @param customView 自定义信息视图(会截取都最后生成的截图中)
 @param handlerView 自定义操作视图(不会截取都最后生成的截图中)
 */
+(instancetype)createCustomScreenShot:(UIImage *)image rect:(CGRect)rect customView:(UIView *)customView handlerView:(UIView *)handlerView;

/**
 @brief 获取生成的自定义截图
 */
-(UIImage *)generateCustomScreenShotImage;

/**
 @brief 关闭自定义截图视图
 */
-(void)remove;
@end

NS_ASSUME_NONNULL_END
