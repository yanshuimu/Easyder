//
//  EDRequestManager.m
//  common
//
//  Created by SPIWsx on 2017/7/25.
//  Copyright © 2017年 ED. All rights reserved.
//

#import "EDRequestManager.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "EDNetInstance.h"

@implementation EDRequestManager

static AFHTTPSessionManager *manager;
static AFURLSessionManager *urlManager;


void EDLog(EDRequestEnty *requestEnty, NSString *format, ...)
{
    if (requestEnty && requestEnty.openLog) {
        
        va_list list;
        va_start(list, format);
        NSString *string = [[NSString alloc] initWithFormat:format arguments:list];
        va_end(list);
        NSLog(@"%@", string);
    }
}

+ (AFHTTPSessionManager *)sharedHttpSessionManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}

+ (AFURLSessionManager *)sharedUrlSessionManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        urlManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return urlManager;
}

+ (void)requestWithEnty:(EDRequestEnty *)requestEnty
{    
    EDLog(requestEnty, @"url == %@\n",requestEnty.requestUrl);
    
    if (requestEnty.requestType == 0) { //请求方式 0:get
        
        EDLog(requestEnty, @"GET params == %@",requestEnty.params);
        
        AFHTTPSessionManager *manager = [self initHttpManager];
        
        [self commonConfigurationWithManager:manager requestEnty:requestEnty];
        
        [manager GET:requestEnty.requestUrl parameters:requestEnty.params headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            EDLog(requestEnty, @"%@", responseObject);
            
            [self commonRequestSuccessWithResponseObject:responseObject requestEnty:requestEnty];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            EDLog(requestEnty, @"%@",task.response);
            
            [self commonRequestFailureWithError:error requestEnty:requestEnty];
        }];
    }
    else if (requestEnty.requestType == 1){//请求方式 1:post
        
        EDLog(requestEnty, @"POST params == %@",requestEnty.params);
        
        AFHTTPSessionManager *manager = [self initHttpManager];
        
        [self commonConfigurationWithManager:manager requestEnty:requestEnty];
        
        [manager POST:requestEnty.requestUrl parameters:requestEnty.params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            EDLog(requestEnty, @"%@", responseObject);
            
            [self commonRequestSuccessWithResponseObject:responseObject requestEnty:requestEnty];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            EDLog(requestEnty, @"%@",task.response);
            
            [self commonRequestFailureWithError:error requestEnty:requestEnty];
        }];
    }
    else if (requestEnty.requestType == 2) { //请求方式 2:post
        
        EDLog(requestEnty, @"POST params == %@",requestEnty.params);
        
        AFURLSessionManager *manager = [self initUrlManager];
        
        NSData *body;
        
        if ([requestEnty.params isKindOfClass:NSDictionary.class]) {
            NSDictionary *dict = requestEnty.params;
            body = dict.mj_JSONData;
        }
        else if ([requestEnty.params isKindOfClass:NSString.class]){
            NSString *string = requestEnty.params;
            body = string.mj_JSONData;
        }
        
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestEnty.requestUrl parameters:nil error:nil];
        request.timeoutInterval = requestEnty.timeoutInterval;
        
        
        //公共头部参数
        for (NSString *key in requestEnty.httpHeaderParams.allKeys) {
            NSString *value = requestEnty.httpHeaderParams[key];
            [request setValue:value forHTTPHeaderField:key];
        }

        // 设置body
        [request setHTTPBody:body];
        
        [[manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
            
        } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
            
        } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            if (!error) {
                
                NSData *data = responseObject;
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                
                EDLog(requestEnty, @"%@", jsonDict);
                
                [self commonRequestSuccessWithResponseObject:jsonDict requestEnty:requestEnty];
                
            } else {
                
                EDLog(requestEnty, @"%@", response);
                
                [self commonRequestFailureWithError:error requestEnty:requestEnty];
            }
            
        }] resume];
    }
    else if (requestEnty.requestType == 3){// 3:上传单张图片
        
        EDLog(requestEnty, @"单张图片上传params == %@",requestEnty.params);
        
        AFHTTPSessionManager *manager = [self initHttpManager];
        
        [self commonConfigurationWithManager:manager requestEnty:requestEnty];
        
        [manager POST:requestEnty.requestUrl parameters:requestEnty.params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            if (requestEnty.singleImage) {
                NSData *imageData = UIImageJPEGRepresentation(requestEnty.singleImage, 0.5);
                [formData appendPartWithFileData:imageData
                                            name:requestEnty.singleImageName
                                        fileName:@"image.jpeg"
                                        mimeType:@"image/jpeg"];
            }
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            EDLog(requestEnty, @"%@", responseObject);
            
            [self commonRequestSuccessWithResponseObject:responseObject requestEnty:requestEnty];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            EDLog(requestEnty, @"%@",task.response);
            
            [self commonRequestFailureWithError:error requestEnty:requestEnty];
        }];
    }
    else if (requestEnty.requestType == 4){//4:上传多张图片
           
        EDLog(requestEnty, @"多张图片上传params == %@",requestEnty.params);
           
        AFHTTPSessionManager *manager = [self initHttpManager];
        
        [self commonConfigurationWithManager:manager requestEnty:requestEnty];
           
        [manager POST:requestEnty.requestUrl parameters:requestEnty.params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
               
               for (int i = 0; i < requestEnty.imagesArray.count; i++) {
                   NSData *imageData = UIImageJPEGRepresentation(requestEnty.imagesArray[i], 0.5);
                   if (i == 0) {
                       NSString *imgName = @"imgthumb";
                       NSString *fileName = @"imgthumb.jpeg";
                       if (requestEnty.imageNamesArray.count != 0) {
                           imgName = requestEnty.imageNamesArray[i];
                           fileName = requestEnty.imageNamesArray[i];;
                       }
                       if (![fileName hasSuffix:@".jpeg"]) {
                           fileName = [NSString stringWithFormat:@"%@.jpeg",fileName];
                       }
                       [formData appendPartWithFileData:imageData
                                                   name:imgName
                                               fileName:fileName
                                               mimeType:@"image/jpeg"];
                   }else{
                       NSString *imgName = [NSString stringWithFormat:@"image%d",i];
                       NSString *fileName =  [NSString stringWithFormat:@"image%d.jpeg",i];
                       if (requestEnty.imageNamesArray.count != 0) {
                           imgName = requestEnty.imageNamesArray[i];
                           fileName = requestEnty.imageNamesArray[i];
                       }
                       if (![fileName hasSuffix:@".jpeg"]) {
                           fileName = [NSString stringWithFormat:@"%@.jpeg",fileName];
                       }
                       [formData appendPartWithFileData:imageData
                                                   name:imgName
                                               fileName:fileName
                                               mimeType:@"image/jpeg"];
                   }
               }
               
       } progress:^(NSProgress * _Nonnull uploadProgress) {
           
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
           EDLog(requestEnty, @"%@", responseObject);
           
           [self commonRequestSuccessWithResponseObject:responseObject requestEnty:requestEnty];
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
           EDLog(requestEnty, @"%@",task.response);
           
           [self commonRequestFailureWithError:error requestEnty:requestEnty];
       }];
    }
    else if (requestEnty.requestType == 5){//5:上传单个视频文件
            
        EDLog(requestEnty, @"单个视频上传params == %@",requestEnty.params);
            
        AFHTTPSessionManager *manager = [self initHttpManager];
        
        [self commonConfigurationWithManager:manager requestEnty:requestEnty];
        
        [manager POST:requestEnty.requestUrl parameters:requestEnty.params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            NSURL *url = requestEnty.params[@"url"];
            NSData *data = [NSData dataWithContentsOfURL:url];
            if (requestEnty.openLog) NSLog(@"%ld", data.length);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *fileName = [NSString stringWithFormat:@"%@.mp4", [formatter stringFromDate:[NSDate date]]];
            [formData appendPartWithFileData:data
                                        name:@"video"
                                    fileName:fileName
                                    mimeType:@"video/mpeg4"];
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            EDLog(requestEnty, @"%@", responseObject);
            
            [self commonRequestSuccessWithResponseObject:responseObject requestEnty:requestEnty];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            EDLog(requestEnty, @"%@",task.response);
            
            [self commonRequestFailureWithError:error requestEnty:requestEnty];
        }];
      }
}

//请求成功响应处理
+ (void)commonRequestSuccessWithResponseObject:(NSDictionary*)responseObject requestEnty:(EDRequestEnty *)requestEnty
{
    EDNetInstance *netInstance = [EDNetInstance shareInstance];
    
    if (netInstance.responseDelegate && [netInstance.responseDelegate respondsToSelector:@selector(commonRequestSuccessWithResponseObject:requestEnty:)]) {
        
        [netInstance.responseDelegate commonRequestSuccessWithResponseObject:responseObject requestEnty:requestEnty];
    }
    else {
        
        [self commonCheckErrorCode:responseObject];
        
        NSString *state = [NSString stringWithFormat:@"%@", responseObject[@"state"]];
        NSString *msg = responseObject[@"msg"];
        BOOL dataSuccess = [state isEqualToString:@"success"];
        requestEnty.response(YES, dataSuccess, msg, responseObject);
    }
}

//请求失败响应处理
+ (void)commonRequestFailureWithError:(NSError*)error requestEnty:(EDRequestEnty *)requestEnty
{
    EDNetInstance *netInstance = [EDNetInstance shareInstance];
    
    if (netInstance.responseDelegate && [netInstance.responseDelegate respondsToSelector:@selector(commonRequestFailureWithError:requestEnty:)]) {
        
        [netInstance.responseDelegate commonRequestFailureWithError:error requestEnty:requestEnty];
    }
    else {
        
        NSString *errorStr = [self returnStringWithError:error];
        requestEnty.response(NO, NO, errorStr, nil);
    }
}

//公共配置
+ (void)commonConfigurationWithManager:(AFHTTPSessionManager *)manager requestEnty:(EDRequestEnty *)requestEnty {
    
    manager.requestSerializer.timeoutInterval = requestEnty.timeoutInterval;
    
    //公共头部参数
    for (NSString *key in requestEnty.httpHeaderParams.allKeys) {
        NSString *value = requestEnty.httpHeaderParams[key];
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }
}

//检查通用错误 可扩展增加相应错误码及相关处理即可
+ (void)commonCheckErrorCode:(id)responseObject
{
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        NSString * state = [NSString stringWithFormat:@"%@",responseObject[@"state"]];
        if (!state || state.length == 0) {
            state = @"";
        }
        if ([state isEqualToString:@"relogin"]) {
            [self performSelector:@selector(tokenErrorBackToLoginCtrl) withObject:nil afterDelay:0.5];
        }
    }
}

+ (void)tokenErrorBackToLoginCtrl
{
    EDNetInstance *netInstance = [EDNetInstance shareInstance];
    
    if (netInstance.responseDelegate && [netInstance.responseDelegate respondsToSelector:@selector(commonRequestFailureRelogin)]) {
        
        [netInstance.responseDelegate commonRequestFailureRelogin];
    }
}

//错误信息处理
+ (NSString *)returnStringWithError:(NSError * _Nonnull)error {
    
    NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
    NSString * errorStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if(![EDNetApiManager getNetStaus]){ //无网统一提示
        errorStr = @"请检查网络连接";
    }else { //有网但是请求错误
        if (!errorStr || errorStr.length == 0) {
            errorStr = @"网络请求错误";
        }
    }
    return errorStr;
}

//AFHTTPSessionManager初始化
+ (AFHTTPSessionManager *)initHttpManager {
    
    AFHTTPSessionManager *manager = [EDRequestManager sharedHttpSessionManager];
    //  JSON序列化
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[ @"application/json", @"text/html", @"text/json", @"text/javascript" ]];
    [manager.requestSerializer setValue:@"MALL_MOBILE_IOS" forHTTPHeaderField:@"Client-Type"];
    [manager.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    manager.requestSerializer.timeoutInterval = 20;
    
    //允许不进行证书验证
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.validatesDomainName = NO;
    securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = securityPolicy;
    
    return manager;
}

//AFHTTPSessionManager初始化
+ (AFURLSessionManager *)initUrlManager {
    
    AFURLSessionManager *manager = [EDRequestManager sharedUrlSessionManager];
    //  JSON序列化
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    
    return manager;
}

+ (UIViewController *)visibleViewController {
    
    UIViewController *rootViewController =[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return [self getVisibleViewControllerFrom:rootViewController];
}

+ (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    }
    else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    }
    else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        }
        else {
            return vc;
        }
    }
}


@end
