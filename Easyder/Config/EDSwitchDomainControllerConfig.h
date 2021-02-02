//
//  EDSwitchDomainControllerConfig.h
//  Easyder
//
//  Created by xuhonggui on 2021/1/29.
//  Copyright © 2021 xuhonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDSwitchDomainControllerConfig : NSObject

//域名
@property (nonatomic, strong) NSArray *domainArray;
//域名备注，可选
@property (nonatomic, strong) NSArray *domainRemarkArray;
//自动登录
@property (nonatomic, copy) void (^autoLoginBlock)(void);
//重新登录
@property (nonatomic, copy) void (^reLoginBlock)(void);
@end

NS_ASSUME_NONNULL_END
