//
//  EDNetApiManager.h
//  common
//
//  Created by SPIwsx on 2017/2/25.
//  Copyright © 2017年 SPIwsx. All rights reserved.
//

#import <UIKit/UIKit.h>

#define EDRequestMsgSendReturnObject(...) ((id (*)(id, SEL))objc_msgSend)(__VA_ARGS__)
#define EDRequestMsgSendReturnInteger(...) ((NSInteger (*)(id, SEL))objc_msgSend)(__VA_ARGS__)

typedef void(^response)(BOOL netSuccess, BOOL dataSuccess, NSString *msg, id responseObject);

@interface EDNetApiManager : NSObject

#pragma mark - 获取网络状态

/**
 * 获取网络状态
 */
+ (BOOL)getNetStaus;

/**
 * Get请求
 */
+ (void)requestGetWithParams:(id)params
                         url:(NSString *)url
                    response:(response)response;

/**
 * Post请求，x-www-form-urlencoded方式
 */
+ (void)requestPostWithParams:(id)params
                          url:(NSString *)url
                     response:(response)response;

/**
 * Post请求，参数通过httpBody传递
 */
+ (void)requestPostWithBodyParams:(id)params
                              url:(NSString *)url
                         response:(response)response;

/**
 * 单张图片上传
 */
+ (void)requestSingleImageWithParams:(NSDictionary *)params
                               image:(UIImage *)uploadImage
                      uploadImageKey:(NSString *)uploadImageKey
                                 url:(NSString *)url
                            response:(response)response;


@end
