//
//  ScreenShotManager.h
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ScreenShotManagerDelegate <NSObject>
// 用户主动截屏() fullScreenImage: 未压缩
-(void)dlActiveScreenShot:(UIImage *)fullScreenImage;

@end

@interface ScreenShotManager : NSObject
+(instancetype)shareManager;
-(void)openScreenShotMonitor;

-(UIImage *)screenShotCurrentWindowWithRect:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
