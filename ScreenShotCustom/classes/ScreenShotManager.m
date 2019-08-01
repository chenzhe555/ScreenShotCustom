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
@property (nonatomic, weak) id<ScreenShotManagerDelegate> delegate;
@property (nonatomic, strong) ScreenShotCustomView * customView;
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

-(void)openScreenShotMonitor
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(monitorScreenShot) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

-(void)closeScreenShotMonitor
{
    
}

-(UIImage *)screenShotCurrentWindowWithRect:(CGRect)rect
{
    UIImage * image = [ScreenShotUtil screenShotWithRect:rect];
    return image;
}

#pragma mark 截图监听通知
-(void)monitorScreenShot
{
    UIImage * image = [ScreenShotUtil fullScreenShot];
    if (self.delegate && [self.delegate respondsToSelector:@selector(dlActiveScreenShot:)]) {
        [self.delegate dlActiveScreenShot:image];
    }
}
@end
