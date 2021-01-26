//
//  DLCBaseNavigationController.m
//  MusiciansAndMuslns
//
//  Created by mac on 2017/5/24.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDNavigationController.h"
#import "NSBundle+EDExtension.h"
#import "UIColor+EDExtension.h"

@interface EDNavigationController ()

@end

@implementation EDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self initialize];
}

- (void)initialize {
        
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    //bar属性
    navigationBar.translucent = NO;
    [navigationBar setShadowImage:[UIImage new]];
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    navigationBar.barTintColor = _configuration.barTintColor;
    NSMutableDictionary *barTitleTextAttributes = [NSMutableDictionary dictionary];
    barTitleTextAttributes[NSFontAttributeName] = _configuration.barTitleFont;
    barTitleTextAttributes[NSForegroundColorAttributeName] = _configuration.barTitleColor;
    navigationBar.titleTextAttributes = barTitleTextAttributes;
    
    //barItem属性
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = _configuration.itemTintColor;
    NSMutableDictionary *itemTitleTextAttributes = [NSMutableDictionary dictionary];
    itemTitleTextAttributes[NSFontAttributeName] = _configuration.itemTitleFont;
    itemTitleTextAttributes[NSForegroundColorAttributeName] = _configuration.itemTitleColor;
    [item setTitleTextAttributes:itemTitleTextAttributes forState:UIControlStateNormal];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    line.backgroundColor = _configuration.bottomLineColor;
    [self.navigationBar addSubview:line];
    line.hidden = _configuration.bottomLineHidden;
}

#pragma mark - Overwrite

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        CGFloat x = 0; CGFloat y = 0; CGFloat width = 0; CGFloat height = 0;
        
        width = height = 44;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *backImageView = [[UIImageView alloc] init];
        
        UIImage *image = _configuration.returnImageName ? [UIImage imageNamed:_configuration.returnImageName] : [NSBundle returnImageFromEasyderBundle];
        backImageView.image = image;
        
        width = image.size.width;
        height = image.size.height;
        x = 5;
        y = btn.frame.size.height/2 - height/2;
        backImageView.frame = CGRectMake(x, y, width, height);
        [btn addSubview:backImageView];
        
        viewController.navigationItem.leftBarButtonItem = leftItem;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)leftClick:(UIButton *)sender {
    [self popViewControllerAnimated:YES];
}

@end
