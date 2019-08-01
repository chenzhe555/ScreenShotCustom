//
//  ScreenShotUtil.m
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "ScreenShotUtil.h"
#import <UIKit/UIKit.h>

@implementation ScreenShotUtil

+(UIWindow *)getMainWindow
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    if (!window)
    {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}

+(UIImage *)fullScreenShot
{
    UIWindow * window = [self getMainWindow];
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, [UIScreen mainScreen].scale);
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)screenShotWithRect:(CGRect)rect
{
    UIImage * image = [self fullScreenShot];
    CGFloat scale = [UIScreen mainScreen].scale;
    rect = CGRectMake(rect.origin.x * scale, rect.origin.y * scale, rect.size.width * scale, rect.size.height * scale);
    image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(image.CGImage, rect)];
    return image;
}
@end
