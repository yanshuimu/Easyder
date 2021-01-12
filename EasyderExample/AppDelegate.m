//
//  AppDelegate.m
//  Easyder
//
//  Created by mac on 2020/12/31.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "EDNavigationController.h"
#import "EDBaseViewController.h"
#import "EasyderManager.h"
#import "UIColor+EDExtension.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor clearColor];
        
    [self setupEasyder];
    
    [self gotoHome];
        
    return YES;
}

- (void)gotoHome {
    
    EDNavigationController *nav = [[EDNavigationController alloc]initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = nav;
    self.window.backgroundColor = EDWhiteColor;
    [self.window makeKeyAndVisible];
}

- (void)setupEasyder {
    
    EasyderManager *manager = [EasyderManager shareManager];
    manager.themeColor = EDHexColor(@"#303642");
    
    //配置EDNavigationController属性
    [manager makeNavigationConfiguration:^(EDConfiguration * _Nullable configuration) {
        configuration.barTintColor = EDHexColor(@"#303642");
        configuration.barTitleColor = EDWhiteColor;
        //configuration.barReturnImageName = @"return2";
    }];
    
    //配置EDBaseAlertView属性
    [manager makeAlertViewConfiguration:^(EDConfiguration * _Nullable configuration) {
        configuration.backgroundColorAlpha = 0.7;
        configuration.alertViewClickMaskOnTheHidden = YES;
    }];
    
    //配置LYEmptyView属性
    [manager makeEmptyViewConfiguration:^(EDConfiguration * _Nullable configuration) {
        //configuration.emptyImageName = @"details14";
        //configuration.networkErrorImageName = @"network_error";
        //configuration.emptyTitle = @"暂无记录";
        //configuration.networkErrorTitle = @"呀，服务器不见了";
        //configuration.emptyButtonTitle = @"点击刷新";
        //configuration.emptyButtonBackgroundColor = EDThemeColor;
        //configuration.emptyButtonTitleColor = EDWhiteColor;
        //configuration.emptyTitleColor = [UIColor redColor];
        //configuration.emptyTitleFont = EDAutoFont(13);
    }];
}

@end
