//
//  EDSwitchDomainControllerConfig.m
//  Easyder
//
//  Created by xuhonggui on 2021/1/29.
//  Copyright © 2021 xuhonggui. All rights reserved.
//

#import "EDSwitchDomainControllerConfig.h"

@implementation EDSwitchDomainControllerConfig

- (instancetype)init
{
    if (self = [super init]) {
        
        _domainArray = @[@"http://www.xxx.com"];
        
        _domainRemarkArray = @[@"示例"];
        
        //调用自动登录方法
        _autoLoginBlock = ^{
            
        };
        
        //调用回到登录界面方法
        _reLoginBlock = ^{
            
        };
    }
    return self;
}

@end
