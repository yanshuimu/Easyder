//
//  DLCBaseViewController.m
//  MusiciansAndMuslns
//
//  Created by mac on 2017/5/24.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDBaseViewController.h"
#import <UIView+EDExtension.h>
#import <EDBaseMacroDefine.h>

@interface EDBaseViewController ()

@end

@implementation EDBaseViewController

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

- (BOOL)fd_prefersNavigationBarHidden{
    return NO;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.view.backgroundColor = EDDefaultBackgroudColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //UINavigationBar方法setTranslucent设置为YES时，需要这行代码，UIViewController的view坐标才是从NavigationBar坐下角开始
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}

-(void)extendedLayout
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%@:内存回收", NSStringFromClass([self class]));
}

@end
