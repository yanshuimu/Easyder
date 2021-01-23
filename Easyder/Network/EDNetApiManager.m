//
//  EDNetApiManager.m
//  common
//
//  Created by SPIwsx on 2017/2/25.
//  Copyright © 2017年 SPIwsx. All rights reserved.
//

#import "EDNetApiManager.h"
#import <objc/message.h>
#import <AFNetworking/AFNetworking.h>
#import "EDRequestManager.h"
#import "EDNetInstance.h"
#import "EDMoninNet.h"

@implementation EDNetApiManager

#pragma mark - 获取网络状态
//获取网络状态
+ (BOOL)getNetStaus
{
    id manager = EDRequestMsgSendReturnObject(objc_getClass("EasyderManager"), sel_registerName("shareManager"));
    if (manager) {
        id moninNet = EDRequestMsgSendReturnObject(manager, sel_registerName("moninNet"));
        NSInteger netStates = EDRequestMsgSendReturnInteger(moninNet, sel_registerName("getNetState"));
        if (netStates == AFNetworkReachabilityStatusNotReachable) {
            return FALSE;
        }
    }
    return TRUE;
}
#pragma mark - 公用请求EDRequestEnty

//公用请求EDRequestEnty
+(EDRequestEnty *)createEntyWithAppendURLString:(NSString *)appendURLString
                                 withRequestEnty:(RequestType)requestType
                                   withParamDict:(id)paramer
                                      withHandle:(Response)responseHandle
{
    EDRequestEnty * enty = [[EDNetInstance shareInstance] commonRequestEnty:requestType withAppendUrlString:appendURLString];  //通用请求配置
    NSMutableDictionary *paramsDict = [[[EDNetInstance shareInstance] basicParameter] mutableCopy];                          //公共请求参数
    //公共请求参数
    if([paramer isKindOfClass:NSDictionary.class]){
        
        NSDictionary *dict = paramer;
        if (dict && dict.count > 0) {
            [paramsDict addEntriesFromDictionary:paramer];
        }
        enty.params = paramsDict;
    }
    else if ([paramer isKindOfClass:NSString.class]) {
        enty.params = paramer;
    }
    enty.response = responseHandle;
    enty.httpHeaderParams = [[[EDNetInstance shareInstance] basicHttpHeaderParameter] mutableCopy];
    
    return enty;
}

#pragma mark -- GET

+ (void)requestGetWithParams:(id)params
                         url:(NSString *)url
                    response:(Response)response
{
    EDRequestEnty *enty = [self createEntyWithAppendURLString:url
                                              withRequestEnty:GetRequestType
                                                withParamDict:params
                                                   withHandle:response];
    [EDRequestManager requestWithEnty:enty];
}

#pragma mark -- POST

+ (void)requestPostWithParams:(id)params
                          url:(NSString *)url
                     response:(Response)response
{
    EDRequestEnty *enty = [self createEntyWithAppendURLString:url
                                              withRequestEnty:PostRequestType
                                                withParamDict:params
                                                   withHandle:response];
    [EDRequestManager requestWithEnty:enty];
}

+ (void)requestPostWithBodyParams:(id)params
                              url:(NSString *)url
                         response:(Response)response
{
    EDRequestEnty *enty = [self createEntyWithAppendURLString:url
                                              withRequestEnty:PostHttpBodyRequestType
                                                withParamDict:params
                                                  withHandle:response];
    [EDRequestManager requestWithEnty:enty];
}

#pragma mark -- POST_IMG

+ (void)requestSingleImageWithParams:(NSDictionary *)params
                               image:(UIImage *)uploadImage
                      uploadImageKey:(NSString *)uploadImageKey
                                 url:(NSString *)url
                            response:(Response)response
{
    EDRequestEnty * enty = [self createEntyWithAppendURLString:url
                                               withRequestEnty:SingleImageUploadRequestType
                                                 withParamDict:params
                                                    withHandle:response];
    enty.singleImage = uploadImage;
    enty.singleImageName = uploadImageKey;
    [EDRequestManager requestWithEnty:enty];
}


@end

