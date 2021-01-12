//
//  EDNetInstance.m
//  qidaimei
//
//  Created by SPIWsx on 2017/3/6.
//  Copyright © 2017年 ED. All rights reserved.
//

#import "EDNetInstance.h"

static EDNetInstance * singleInstance = nil;

@implementation EDNetInstance

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleInstance = [[EDNetInstance alloc] init];
    });
    return singleInstance;
}

//网络请求基础配置
- (EDRequestEnty *)commonRequestEnty:(RequestType)requestType
                 withAppendUrlString:(NSString *)appendURLString
{
    EDRequestEnty * enty = [[EDRequestEnty alloc] init];
    enty.requestUrl = appendURLString;
    switch (requestType) {
        case GetRequestType:   //GET请求
            enty.requestType = 0;
            break;
        case PostRequestType:  //POST请求
            enty.requestType = 1;
            break;
        case PostHttpBodyRequestType:  //POST请求
            enty.requestType = 2;
            break;
        case SingleImageUploadRequestType: //单张图片上传
            enty.requestType = 3;
            break;
        case ImagesArrayUploadRequestType: //多张图片上传
            enty.requestType = 4;
            break;
        case SingleVideoUploadRequestType: //单视频文件上传
            enty.requestType = 5;
            break;
        default:
            enty.requestType = 1; //默认为POST
            break;
    }
    
    //超时时间
    if (_configurationDelegate && [_configurationDelegate respondsToSelector:@selector(commonRequestTimeoutInterval)]) {
        enty.timeoutInterval = [_configurationDelegate commonRequestTimeoutInterval];
    }
    else {
        enty.timeoutInterval = 20;
    }
    
    //日志打印
    if (_configurationDelegate && [_configurationDelegate respondsToSelector:@selector(commonRequestOpenLog)]) {
        enty.openLog = [_configurationDelegate commonRequestOpenLog];
    }
    else {
        enty.openLog = YES;
    }
    
    return enty;
}

//公共基础参数
- (NSMutableDictionary *)basicParameter
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    if (_configurationDelegate && [_configurationDelegate respondsToSelector:@selector(commonRequestBasicParameter)]) {
        
        NSMutableDictionary *params = [_configurationDelegate commonRequestBasicParameter];
        [dict addEntriesFromDictionary:params];
        
        if ([_configurationDelegate respondsToSelector:@selector(commonRequestOpenLog)]) {
            BOOL openLog = [_configurationDelegate commonRequestOpenLog];
            if (openLog) NSLog(@"dict == 基础参数 == %@",dict);
        }
    }
    return dict;
}

//请求头参数
- (NSMutableDictionary *)basicHttpHeaderParameter
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    if (_configurationDelegate && [_configurationDelegate respondsToSelector:@selector(commonRequestBasicHttpHeaderParameter)]) {
        
        NSMutableDictionary *params = [_configurationDelegate commonRequestBasicHttpHeaderParameter];
        [dict addEntriesFromDictionary:params];
        
        if ([_configurationDelegate respondsToSelector:@selector(commonRequestOpenLog)]) {
            BOOL openLog = [_configurationDelegate commonRequestOpenLog];
            if (openLog) NSLog(@"dict == 基础头部参数 == %@",dict);
        }
    }
    return dict;
}


@end
