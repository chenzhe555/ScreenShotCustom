//
//  ScreenShotCustomView.m
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "ScreenShotCustomView.h"
#import "ScreenShotUtil.h"

@interface ScreenShotCustomView ()
// 截图视图
@property (nonatomic, strong) UIImageView * screenShotView;
// 自定义视图(包含在最终截图)
@property (nonatomic, strong) UIView * customView;
// 操作视图(不包含在最终截图)
@property (nonatomic, strong) UIView * handlerView;
@end

@implementation ScreenShotCustomView

+(instancetype)createCustomScreenShot:(UIImage *)image rect:(CGRect)rect customView:(UIView *)customView handlerView:(UIView *)handlerView
{
    UIWindow * window = [ScreenShotUtil getMainWindow];
    
    ScreenShotCustomView * view = [ScreenShotCustomView new];
    view.frame = window.bounds;
    view.backgroundColor = [UIColor whiteColor];
    [window addSubview:view];
    
    [view createScreenShotView:image rect:rect];
    [view createCustomView:customView];
    [view createHandlerView:handlerView];
    
    return view;
}

-(void)createScreenShotView:(UIImage *)image rect:(CGRect)rect
{
    self.screenShotView = [[UIImageView alloc] init];
    self.screenShotView.image = image;
    self.screenShotView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - rect.size.width)/2, 0, rect.size.width, rect.size.height);
    [self addSubview:self.screenShotView];
}

-(void)createCustomView:(UIView *)customView
{
    self.customView = customView;
    self.customView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - self.customView.frame.size.width)/2, self.screenShotView.frame.origin.y + self.screenShotView.frame.size.height, self.customView.frame.size.width, self.customView.frame.size.height);
    [self addSubview:self.customView];
}

-(void)createHandlerView:(UIView *)handlerView
{
    self.handlerView = handlerView;
    self.handlerView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - self.handlerView.frame.size.width)/2, self.customView.frame.origin.y + self.customView.frame.size.height, self.handlerView.frame.size.width, self.handlerView.frame.size.height);
    [self addSubview:self.handlerView];
}

-(UIImage *)generateCustomScreenShotImage
{
    return [ScreenShotUtil screenShotWithRect:CGRectMake(0, 0, self.bounds.size.width, self.customView.frame.origin.y + self.customView.frame.size.height)];
}

-(void)remove
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
}
@end
