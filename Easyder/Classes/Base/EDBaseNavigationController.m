//
//  DLCBaseNavigationController.m
//  MusiciansAndMuslns
//
//  Created by mac on 2017/5/24.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDBaseNavigationController.h"

@interface EDBaseNavigationController ()

@end

@implementation EDBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialize];
}

- (void)initialize{
    
    //设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //设置导航栏背景颜色
    [UINavigationBar appearance].barTintColor = kThemeColor;
    
    //设置导航栏标题文字颜色
    NSMutableDictionary *color = [NSMutableDictionary dictionary];
    color[NSFontAttributeName] = kFont(17);
    
    color[NSForegroundColorAttributeName] = KWhiteColor;
    
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    
    //拿到整个导航控制器的外观
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    item.tintColor = KWhiteColor;
    //设置字典的字体大小
    NSMutableDictionary * atts = [NSMutableDictionary dictionary];
    
    atts[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    atts[NSForegroundColorAttributeName] = KBlackColor;
    
    //将字典给item
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    /*
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, SCREEN_W, 0.5)];
    lineView.backgroundColor = kLineColor;
    [self.navigationBar addSubview:lineView];
    _lineView = lineView;
     */
}

- (UIImage *)imageWithBgColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//重写nav的push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    ///如果在堆栈控制器数量大于1 加返回按钮
    if (self.viewControllers.count > 0) {
        
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        
        UIImageView *backImgV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 9, 17)];
        backImgV.image = [UIImage imageNamed:@"return_key_while"];
        [backImgV setCenterY:btn.centerY];
        [btn addSubview:backImgV];
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = leftItem;
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    } else {
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)leftClick:(UIButton *)sender{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
