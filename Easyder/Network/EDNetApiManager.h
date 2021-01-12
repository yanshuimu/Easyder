//
//  EDNetApiManager.h
//  common
//
//  Created by SPIwsx on 2017/2/25.
//  Copyright © 2017年 SPIwsx. All rights reserved.
//

#import <UIKit/UIKit.h>

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
+ (void)requestGetWithParamDict:(id)paramer
                            Url:(NSString *)url
                     withHandle:(response)responseHandle;

/**
 * Post请求，x-www-form-urlencoded方式
 */
+ (void)requestPostWithParamDict:(id)paramer
                             Url:(NSString *)url
                      withHandle:(response)responseHandle;

/**
 * Post请求，httpBody方式
 */
+ (void)requestPostHttpBodyWithParamDict:(id)paramer
                                     Url:(NSString *)url
                              withHandle:(response)responseHandle;

/**
 * 单张图片上传
 */
+ (void)requestSingleImgWithDict:(NSDictionary *)paramer
                             Img:(UIImage *)uploadImg
                   uploadImgKey:(NSString *)uploadImgKey
                            Url:(NSString *)url
                     withHandle:(response)responseHandle;


@end
