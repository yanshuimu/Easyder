//
//  EDNetInstance.h
//  qidaimei
//
//  Created by SPIWsx on 2017/3/6.
//  Copyright © 2017年 ED. All rights reserved.

#import <Foundation/Foundation.h>
#import "EDRequestEnty.h"

typedef NS_ENUM(NSInteger, RequestType) {
    GetRequestType = 1,
    PostRequestType, //x-www-form-urlencoded
    PostHttpBodyRequestType, //httpBody
    SingleImageUploadRequestType,
    ImagesArrayUploadRequestType,
    SingleVideoUploadRequestType
};

@protocol EDNetConfigurationDelegate <NSObject>

@optional

/**
 * 是否开启日志打印
 */
- (BOOL)commonRequestOpenLog;

/**
 * 网络请求超时时间
 */
- (NSInteger)commonRequestTimeoutInterval;

/**
 * 公共基础参数
 */
- (NSMutableDictionary *)commonRequestBasicParameter;

/**
 * 公共请求头参数
 */
- (NSMutableDictionary *)commonRequestBasicHttpHeaderParameter;

@end

@protocol EDNetResponseDelegate <NSObject>

@optional
/**
 * 请求成功响应参数
 */
- (void)commonRequestSuccessWithResponseObject:(id)responseObject requestEnty:(EDRequestEnty *)requestEnty;

/**
 * 请求失败响应参数
 */
- (void)commonRequestFailureWithError:(NSError*)error requestEnty:(EDRequestEnty *)requestEnty;

/**
 * 重新登录
 */
- (void)commonRequestFailureRelogin;

@end

@interface EDNetInstance : NSObject

+ (instancetype)shareInstance;

//配置参数代理
@property (nonatomic, weak) id<EDNetConfigurationDelegate> configurationDelegate;

//请求响应代理
@property (nonatomic, weak) id<EDNetResponseDelegate> responseDelegate;

//网络请求基础配置
- (EDRequestEnty *)commonRequestEnty:(RequestType)requestType
                 withAppendUrlString:(NSString *)appendURLString;
//公共基础参数
- (NSMutableDictionary *)basicParameter;

//请求头参数
- (NSMutableDictionary *)basicHttpHeaderParameter;

@end
