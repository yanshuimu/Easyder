//
//  EDSwitchDomainController.h
//  Kehouyi
//
//  Created by apple on 2019/8/16.
//  Copyright © 2019 xuhonggui. All rights reserved.
//

/*
 
 *********************************************************************************
 *
 * 使用方法：
 * 1、实例化本类，在AppDelegate中设置为self.window的rootViewController，建议加上NavigationController;
 * 2、网络请求域名设置为宏定义EDSwitchDomain
 * 3、在EDConfig类别中重写switchDomainControllerConfig方法实现自定义配置
 *
 *********************************************************************************
 
 */

#import <UIKit/UIKit.h>
#import "EDConfig.h"

NS_ASSUME_NONNULL_BEGIN

#define EDSwitchDomainLastDomain @"EDSwitchDomainLastDomain"

#define EDSwitchDomainUserDefaults [NSUserDefaults standardUserDefaults]

#define EDSwitchDomain [EDSwitchDomainUserDefaults valueForKey:EDSwitchDomainLastDomain]

@interface EDSwitchDomainController : UIViewController

//
@property (nonatomic, strong) EDSwitchDomainControllerConfig *config;

@end

NS_ASSUME_NONNULL_END
