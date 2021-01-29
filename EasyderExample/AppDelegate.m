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
    manager.consoleEnable = YES;
    [manager startMoninNet];
}

@end
