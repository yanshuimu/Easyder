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
                                      withHandle:(response)responseHandle
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
    enty.responseHandle = responseHandle;
    enty.httpHeaderParams = [[[EDNetInstance shareInstance] basicHttpHeaderParameter] mutableCopy];
    
    return enty;
}

#pragma mark -- GET

+ (void)requestGetWithParamDict:(id)paramer
                             Url:(NSString *)url
                      withHandle:(response)responseHandle
{
    EDRequestEnty *enty = [self createEntyWithAppendURLString:url
                                              withRequestEnty:GetRequestType
                                                withParamDict:paramer
                                                   withHandle:responseHandle];
    [EDRequestManager requestWithEnty:enty];
}

#pragma mark -- POST

+ (void)requestPostWithParamDict:(id)paramer
                             Url:(NSString *)url
                       withHandle:(response)responseHandle
{
    EDRequestEnty *enty = [self createEntyWithAppendURLString:url
                                              withRequestEnty:PostRequestType
                                                withParamDict:paramer
                                                   withHandle:responseHandle];
    [EDRequestManager requestWithEnty:enty];
}

+ (void)requestPostHttpBodyWithParamDict:(id)paramer
                                     Url:(NSString *)url
                              withHandle:(response)responseHandle
{
    EDRequestEnty *enty = [self createEntyWithAppendURLString:url
                                              withRequestEnty:PostHttpBodyRequestType
                                                withParamDict:paramer
                                                  withHandle:responseHandle];
    [EDRequestManager requestWithEnty:enty];
}

#pragma mark -- POST_IMG

+ (void)requestSingleImgWithDict:(NSDictionary *)paramer
                             Img:(UIImage *)uploadImg
                    uploadImgKey:(NSString *)uploadImgKey
                             Url:(NSString *)url
                      withHandle:(response)responseHandle
{
    EDRequestEnty * enty = [self createEntyWithAppendURLString:url
                                               withRequestEnty:SingleImageUploadRequestType
                                                 withParamDict:paramer
                                                    withHandle:responseHandle];
    enty.singleImage = uploadImg;
    enty.singleImageName = uploadImgKey;
    [EDRequestManager requestWithEnty:enty];
}


@end

