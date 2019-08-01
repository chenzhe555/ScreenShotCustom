//
//  ViewController.m
//  ScreenShotCustom
//
//  Created by yunshan on 2019/8/1.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "ViewController.h"
#import "ScreenShotManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"12dabdhadahbdas";
    label.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:label];

    
    UILabel * label2 = [[UILabel alloc] init];
    label2.text = @"end";
    label2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 100, 50, 20);
    label2.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:label2];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 160, 80, 30);
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)test
{
    [[ScreenShotManager shareManager] screenShotCurrentWindowWithRect:CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width - 100, 200)];
}


@end
