//
//  DLCBaseNavigationController.m
//  MusiciansAndMuslns
//
//  Created by mac on 2017/5/24.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDNavigationController.h"
#import "EDConfiguration.h"
#import "NSBundle+EDExtension.h"
#import "UIColor+EDExtension.h"
#import "EasyderManager.h"

@interface EDNavigationController ()
//底部横线
@property (nonatomic, strong) UIView *lineView;
//
@property (nonatomic, strong) UIColor *barTintColor;
//
@property (nonatomic, strong) UIColor *titleColor;
//
@property (nonatomic, strong) UIFont *titleFont;
//
@property (nonatomic, copy) NSString *returnImageName;
//
@property (nonatomic, assign) BOOL bottomLineHidden;
@end

@implementation EDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configuration];
    
    [self edInitialize];
}

- (void)edInitialize {
        
    //设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //设置导航栏背景颜色
    [UINavigationBar appearance].barTintColor = _barTintColor;
    
    //设置导航栏标题文字颜色
    NSMutableDictionary *color = [NSMutableDictionary dictionary];
    color[NSFontAttributeName] = _titleFont;
    
    color[NSForegroundColorAttributeName] = _titleColor;
    
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    
    //拿到整个导航控制器的外观
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    item.tintColor = _barTintColor;
    //设置字典的字体大小
    NSMutableDictionary * atts = [NSMutableDictionary dictionary];
    
    atts[NSFontAttributeName] = _titleFont;
    atts[NSForegroundColorAttributeName] = _titleColor;
    
    //将字典给item
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, SCREEN_W, 0.5)];
    lineView.backgroundColor = EDLineColor;
    [self.navigationBar addSubview:lineView];
    _lineView = lineView;
    
    _lineView.hidden = _bottomLineHidden;
}

- (void)configuration {
    
    EDConfiguration *configuration = EDManagerSingleton.navigationConfiguration;
    
    _barTintColor = EDISNIL(configuration.barTintColor) ? EDManagerSingleton.themeColor : configuration.barTintColor;
    _titleFont = EDISNIL(configuration.barTitleFont) ? EDFont(17) : configuration.barTitleFont;
    _titleColor = EDISNIL(configuration.barTitleColor) ? EDFontColorBlack : configuration.barTitleColor;
    _bottomLineHidden = configuration.barBottomLineHidden;
    _returnImageName = configuration.barReturnImageName;
}

//重写nav的push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    ///如果在堆栈控制器数量大于1 加返回按钮
    if (self.viewControllers.count > 0) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        
        UIImageView *backImgV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 9, 17)];
        backImgV.image = EDStringIsEmpty(_returnImageName) ? [NSBundle returnImageFromEasyderBundle] : [UIImage imageNamed:_returnImageName];
        [backImgV setCenterY:btn.centerY];
        [btn addSubview:backImgV];
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = leftItem;
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)leftClick:(UIButton *)sender{
    [self popViewControllerAnimated:YES];
}

@end
