//
//  DLCBaseNavigationController.m
//  MusiciansAndMuslns
//
//  Created by xuhonggui on 2017/5/24.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import "EDNavigationController.h"
#import "NSBundle+EDExtension.h"

@interface EDNavigationController ()
//
@property (nonatomic, strong) UIView *line;
@end

@implementation EDNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController style:(EDNavigationControllerStyle*)style {
    
    if (self = [super initWithRootViewController:rootViewController]) {
        
        [self setStyle:style];
    }
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    if (self = [super initWithRootViewController:rootViewController]) {
        
        [self setStyle:[EDConfig navigationControllerStyle]];
    }
    return self;
}

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
    
    
    _line = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    [self.navigationBar addSubview:_line];
}

- (void)setStyle:(EDNavigationControllerStyle *)style {
    
    _style = style;
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    navigationBar.barTintColor = _style.barTintColor;
    NSMutableDictionary *barTitleTextAttributes = [NSMutableDictionary dictionary];
    barTitleTextAttributes[NSFontAttributeName] = _style.barTitleFont;
    barTitleTextAttributes[NSForegroundColorAttributeName] = _style.barTitleColor;
    navigationBar.titleTextAttributes = barTitleTextAttributes;
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = _style.itemTintColor;
    NSMutableDictionary *itemTitleTextAttributes = [NSMutableDictionary dictionary];
    itemTitleTextAttributes[NSFontAttributeName] = _style.itemTitleFont;
    itemTitleTextAttributes[NSForegroundColorAttributeName] = _style.itemTitleColor;
    [item setTitleTextAttributes:itemTitleTextAttributes forState:UIControlStateNormal];
    
    _line.backgroundColor = _style.bottomLineColor;
    _line.hidden = _style.bottomLineHidden;
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
        
        if (_style.returnImageName) {
            backImageView.image = [UIImage imageNamed:_style.returnImageName];
        }
        else {
            backImageView.image = [NSBundle returnImageFromEasyderBundle];
        }
        
        width = backImageView.image.size.width;
        height = backImageView.image.size.height;
        x = _style.returnButtonOffsetX;
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
