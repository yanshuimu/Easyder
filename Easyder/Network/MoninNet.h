//
//  MoninNet.h
//  Qin
//
//  Created by SPIwsx on 2017/7/25.
//  Copyright © 2017年 ED. All rights reserved.

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

//未知网络状态通知
#define EDNetworkReachabilityStatusUnknown      @"EDNetworkReachabilityStatusUnknown"
//网络不可用通知
#define EDNetworkReachabilityStatusNotReachable @"EDNetworkReachabilityStatusNotReachable"
//网络可用通知
#define EDNetworkReachabilityStatusReachable    @"EDNetworkReachabilityStatusReachable"

@interface MoninNet : NSObject

/**
 * 开始网络监测
 */
- (void)startMoninNet;

/**
 * 停止网络监测
 */
- (void)stopMoninNet;

/*
 * 获取当前使用的网络状态
 */
- (AFNetworkReachabilityStatus)getNetState;

@end
