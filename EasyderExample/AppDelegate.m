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
#import <MangoFix.h>
#import "EDMangoFix.h"

#define kRSAPrivateKey @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBANTrw+drTSE80JYi9WFzZwk7ySZhnzvsgkAyTfr5OLLNsJ8WwR/JuiURIfvC4S1ekTGdiZeK1Fa0pTMezpNEEPu+8hKM0eQ79qhrDbnHyUryMWN1RDVBM8QWhXoCyLl92c+ADZAcLWw+VJQyAP4QPmQnavIJpVhu/bX5mjdCc0+5AgMBAAECgYEAyedv88jacQQ8P8KSsYA/WpAo5I558tcJhFqve6hMzbEjJRjstXoTXAbtFNHtuZoNUOE0klGBnV7bsKgr95X6CyOwPZbHiiT/+PjrTUXsIleeuFuN6vs7CUECAnoPzGuROQMhOUrXAuFJPtUzFkyvTWWoRsnchEsjrK8sHJOkhAECQQD3lS+0+Z1sr4wSeCXkwDwge7fx2nm0Fe0e893+vwHlDXF/j5vGWnWn5jMGOhTRSvT4AOAAk3qQcwYU2Su3Ng/BAkEA3CjnMnthwZFyxBTMX9QwdWpvQS5nX0B5GpHVgT9/R6x02sIJebPDuqfzbAOh02vocBsNNP4zSggfGHcDdF09+QJAK0BjwjDtQIR2au+UZx7yIhaa7uRk6IIAF60wtgU2VoZ/snIrG37IGRnNBiR1aI64tu6oM1GQUtXVVSUPTwVhwQJBANjVhFfJA0/lU/ZhUaT0VMHgETFOZct/sYcEqRbCFjbeWLz4LOLrtVPKhMoWjbSwa962FfzifFtmwlGTLhjWmOkCQGV8U3E0oXDeDTmqvybaygL1Ifgk0PH4jYIKFa939nds6ocwkN/G2gVxFIaxQrdflIrTYdHnvR+95dp7A5v4uZU="

#define EASYMANGOFIX_APPID @"b48aa252796743ef97f388a868dd0827"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor clearColor];
    
    [self setupEasyMangoFix];
    
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

- (void)setupEasyMangoFix {
        
    EDMangoFix *edMangoFix = [EDMangoFix sharedInstance];
    [edMangoFix startWithAppId:EASYMANGOFIX_APPID RSAPrivateKey:kRSAPrivateKey debug:YES];
        
    //执行远程补丁
    [edMangoFix evalRemoteMangoScript];
    
    //执行本地补丁
    //[edMangoFix evalLocalMangoScript];
    
}

@end
