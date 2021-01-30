//
//  EDConfig.m
//  Easyder
//
//  Created by mac on 2021/1/29.
//

#import "EDConfig.h"

@implementation EDConfig

+ (EDNavigationControllerStyle*)navigationControllerStyle {
    
    EDNavigationControllerStyle *style = [[EDNavigationControllerStyle alloc] init];
    
    style.barTintColor = [UIColor whiteColor];
    style.barTitleFont = [UIFont systemFontOfSize:17];
    style.barTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    style.itemTintColor = [UIColor whiteColor];
    style.itemTitleFont = [UIFont systemFontOfSize:17];
    style.itemTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    style.bottomLineColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    style.bottomLineHidden = NO;
    
    style.returnButtonOffsetX = 5;
    
    return style;
}

+ (EDBaseAlertViewStyle*)baseAlertViewStyle {
    
    EDBaseAlertViewStyle *style = [[EDBaseAlertViewStyle alloc] init];
    
    style.backgroundColorAlpha = 0.70;
    style.animated = YES;
    style.clickMaskWithHidden = NO;
    
    return style;
}

+ (EDEmptyViewStyle*)emptyViewStyle {
    
    EDEmptyViewStyle *style = [[EDEmptyViewStyle alloc] init];
    
    style.networkErrorTitle = @"呀，网络出了问题";
    style.networkErrorButtonTitle = @"重新连接网络";
    style.title = @"暂时没有内容";
    style.buttonBackgroundColor = [UIColor whiteColor];
    style.buttonTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    style.titleFont = [UIFont systemFontOfSize:13];
    style.titleColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    style.buttonHeight = 40.0;
    style.buttonCornerRadius = 5.0;
    
    //在block中根据emptyPageType枚举值处理不同情况界面展示
     style.conditionsBlock = ^(NSInteger emptyPageType) {
         
         switch (emptyPageType) {
             default://其它页面（这里没有提到的页面，都属于其它）
             {
                 
             }
                 break;
         }
     };
     
    return style;
}

+ (EDSwitchDomainControllerConfig*)switchDomainControllerConfig {
    
    EDSwitchDomainControllerConfig *config = [[EDSwitchDomainControllerConfig alloc] init];
    
    config.domainArray = @[];
    
    config.domainRemarkArray = @[];
    
    //调用自动登录方法
    config.autoLoginBlock = ^{
        
    };
    
    //调用回到登录界面方法
    config.reLoginBlock = ^{
        
    };
    
    return config;
}

@end
