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
+(instancetype)createCustomScreenShot:(UIImage *)image rect:(CGRect)rect customView:(UIView *)customView handlerView:(UIView *)handlerView;

-(UIImage *)generateCustomScreenShotImage;

-(void)remove;
@end

NS_ASSUME_NONNULL_END
