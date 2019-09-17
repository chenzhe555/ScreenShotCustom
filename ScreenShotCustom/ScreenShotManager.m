//
//  ScreenShotManager.m
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "ScreenShotManager.h"
#import <UIKit/UIKit.h>
#import "ScreenShotUtil.h"
#import "ScreenShotCustomView.h"

@interface ScreenShotManager ()
@property (nonatomic, strong) ScreenShotCustomView * customView;
@property (nonatomic, copy) ActiveScreenShotCallback activeCallback;
@end

@implementation ScreenShotManager
+(instancetype)shareManager
{
    static ScreenShotManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [ScreenShotManager new];
    });
    return manager;
}

-(void)openScreenShotMonitor:(ActiveScreenShotCallback)callback
{
    self.activeCallback = callback;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(monitorScreenShot) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

-(void)closeScreenShotMonitor
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

-(UIImage *)fullScreenShot
{
    return [ScreenShotUtil fullScreenShot];
}

-(void)generateCustomScreenShot:(UIImage *)image rect:(CGRect)rect customView:(UIView *)customView handlerView:(UIView *)handlerView
{
    self.customView = [ScreenShotCustomView createCustomScreenShot:image rect:rect customView:customView handlerView:handlerView];
}

-(UIImage *)generateCustomScreenShotImage
{
    if (self.customView) return [self.customView generateCustomScreenShotImage];
    else return nil;
}

-(void)closeCustomScreenShotView
{
    [self.customView remove];
    self.customView = nil;
}

#pragma mark 截图监听通知
-(void)monitorScreenShot
{
    UIImage * image = [ScreenShotUtil fullScreenShot];
    if (self.activeCallback) self.activeCallback(image);
}
@end
