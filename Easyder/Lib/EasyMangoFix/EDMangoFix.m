//
//  EDMangoFix.m
//  MYYManager
//
//  Created by mac on 2020/4/9.
//  Copyright © 2020 mac. All rights reserved.
//

#import "EDMangoFix.h"
#import <MangoFix.h>
#import "EDBaseMacroDefine.h"

#define MANGOFIX_BASE_URL @"http://47.115.42.149:8080/mangofix"
//#define MANGOFIX_BASE_URL @"http://127.0.0.1:8090/mangofix"

#define MANGOFIX_GETMANGOFILE_URL [NSString stringWithFormat:@"%@/api/getmangofile", MANGOFIX_BASE_URL]

typedef void(^CompleteBlock)(NSDictionary *dict);

@interface EDMangoFix ()
//
@property (nonatomic, copy) NSString *appId;
//
@property (nonatomic, copy) NSString *RSAPrivateKey;
//
@property (nonatomic, assign) BOOL debug;
@end

@implementation EDMangoFix

+ (instancetype)sharedInstance
{
    static EDMangoFix *easyMangoFix = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        easyMangoFix = [[self alloc] init];
    });
    return easyMangoFix;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)startWithAppId:(NSString*)appId RSAPrivateKey:(NSString*)RSAPrivateKey debug:(BOOL)debug {
    
    _appId = appId;
    _RSAPrivateKey = RSAPrivateKey;
    _debug = debug;
    //向后台注册当前版本号
}

- (NSString*)fixFileDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString*)getBundleShortVersion {
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict valueForKey:@"CFBundleShortVersionString"];
}

- (void)evalRemoteMangoScript {
    
    if (EDStringIsEmpty(_RSAPrivateKey)) {
        NSLog(@"RSAPrivateKey is null or empty");
        return;
    }
    
    MFContext *context = [[MFContext alloc] initWithRSAPrivateKey:_RSAPrivateKey];
    
    [self checkRemoteFixWithCompletion:^(NSDictionary *dict) {
        NSString *fileName = @"demo.mg";
        NSString *fileDirectory = [self fixFileDirectory];
        NSString *filePath = [fileDirectory stringByAppendingPathComponent:fileName];
        //执行补丁
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
           
            //exec remote mango file
            NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
            if (script && script.length > 0) {
                [context evalMangoScriptWithRSAEncryptedBase64String:script];
            }
        }
    }];
}

- (void)evalLocalMangoScript {
    
    if (EDStringIsEmpty(_RSAPrivateKey)) {
        NSLog(@"RSAPrivateKey is null or empty");
        return;
    }
    
    MFContext *context = [[MFContext alloc] initWithRSAPrivateKey:_RSAPrivateKey];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"encrypted_demo" ofType:@"mg"];
    NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if (script && script.length > 0) {
        [context evalMangoScriptWithRSAEncryptedBase64String:script];
    }
}

#pragma mark - 网络请求

- (void)checkRemoteFixWithCompletion:(CompleteBlock)completion {
        
    @try {
        if (completion) {
            completion(nil);
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
    @finally {
        //拉取远程补丁
        [self remoteMangoFixFileWithCompletion:completion];
    }
}

- (void)remoteMangoFixFileWithCompletion:(CompleteBlock)completion
{
    NSURL *url = [NSURL URLWithString:MANGOFIX_GETMANGOFILE_URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSString *bodyString = [NSString stringWithFormat:@"appid=%@&version=%@&debug=%@", _appId, [self getBundleShortVersion], @(_debug)];
    request.HTTPBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //后台定义返回statusCode，以实际情况为准
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if (data && httpResponse.statusCode == 201) {
            
            NSString *cachesPath = [self fixFileDirectory];
            NSString *filePath = [cachesPath stringByAppendingPathComponent:@"demo.mg"];
            //NSLog(@"EasyMangoFix: filePath--%@", filePath);
            
            if ([data writeToFile:filePath atomically:YES]) {
                NSLog(@"EasyMangoFix: file save success!");
                if (data.length > 0 && completion) {
                    completion(nil);
                }
            }
            else {
                NSLog(@"EasyMangoFix: file save fail!");
            }
        }
        if (error) {
            NSLog(@"EasyMangoFix: CheckRemoteFix fail, error:%@", error);
        }
    }];
    [task resume];
}

@end
