//
//  EDConfig.m
//  Easyder
//
//  Created by xuhonggui on 2021/1/29.
//

#import "EDConfig.h"

@implementation EDConfig

+ (EDNavigationControllerStyle*)navigationControllerStyle {
    
    EDNavigationControllerStyle *style = [[EDNavigationControllerStyle alloc] init];
    
    return style;
}

+ (EDBaseAlertViewStyle*)baseAlertViewStyle {
    
    EDBaseAlertViewStyle *style = [[EDBaseAlertViewStyle alloc] init];
    
    return style;
}

+ (EDEmptyViewStyle*)emptyViewStyle {
    
    EDEmptyViewStyle *style = [[EDEmptyViewStyle alloc] init];
     
    return style;
}

+ (EDSwitchDomainControllerConfig*)switchDomainControllerConfig {
    
    EDSwitchDomainControllerConfig *config = [[EDSwitchDomainControllerConfig alloc] init];
    
    return config;
}

@end
