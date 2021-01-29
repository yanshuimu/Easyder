//
//  EDConfig.h
//  Easyder
//
//  Created by mac on 2021/1/29.
//

/*
 
 *********************************************************************************
 *
 * 新建EDConfig类别并重写本类定义的方法就可以实现自定义配置
 *
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>
#import "EDNavigationControllerStyle.h"
#import "EDBaseAlertViewStyle.h"
#import "EDEmptyViewStyle.h"
#import "EDSwitchDomainControllerConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface EDConfig : NSObject

+ (EDNavigationControllerStyle*)navigationControllerStyle;

+ (EDBaseAlertViewStyle*)baseAlertViewStyle;

+ (EDEmptyViewStyle*)emptyViewStyle;

+ (EDSwitchDomainControllerConfig*)switchDomainControllerConfig;

@end

NS_ASSUME_NONNULL_END
