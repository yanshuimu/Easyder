//
//  EDMangoFix.m
//  MYYManager
//
//  Created by mac on 2020/4/9.
//  Copyright © 2020 mac. All rights reserved.
//

#import "EDMangoFixUtil.h"
#import <objc/message.h>
#import "EDUtils.h"

#define ED_MANGOFIX_BASE_URL @"http://47.115.42.149:8080/mangofix"

#define ED_MANGOFIX_PATCH_URL_PATH @"/api/getmangofile"

#define ED_MANGOFIX_GETMANGOFILE_URL [NSString stringWithFormat:@"%@%@", ED_MANGOFIX_BASE_URL, ED_MANGOFIX_PATCH_URL_PATH]

typedef void(^CompleteBlock)(NSDictionary *dict);

@interface EDMangoFixUtil ()
//
@property (nonatomic, copy) NSString *appId;
//
@property (nonatomic, assign) BOOL debug;
//
@property (nonatomic, copy) NSString *privateKey;
@end

@implementation EDMangoFixUtil

+ (instancetype)sharedInstance
{
    static EDMangoFixUtil *mangoFixUtil = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        mangoFixUtil = [[self alloc] init];
    });
    return mangoFixUtil;
}

- (instancetype)init {
    if (self = [super init]) {
        _statusCode = 201;
    }
    return self;
}

- (void)startWithAppId:(NSString*)appId privateKey:(NSString*)privateKey {
    [self startWithAppId:appId privateKey:privateKey debug:NO];
}

- (void)startWithAppId:(NSString*)appId privateKey:(NSString*)privateKey debug:(BOOL)debug {
    
    _appId = appId;
    _debug = debug;
    _privateKey = privateKey;
}

- (void)evalRemoteMangoScript {
    
    if ([EDUtils stringIsEmpty:_privateKey]) {
        NSLog(@"privateKey is null or empty");
        return;
    }
    
    id context = ((id (*) (id, SEL))objc_msgSend)(objc_getClass("MFContext"), sel_registerName("alloc"));
    ((void (*) (id, SEL, NSString *))objc_msgSend)(context, sel_registerName("initWithRSAPrivateKey:"), _privateKey);
    
    [self checkRemoteFixWithCompletion:^(NSDictionary *dict) {
        NSString *fileName = @"demo.mg";
        NSString *fileDirectory = [self fixFileDirectory];
        NSString *filePath = [fileDirectory stringByAppendingPathComponent:fileName];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
            if (script && script.length > 0) {
                ((void (*) (id, SEL, NSString *))objc_msgSend)(context, sel_registerName("evalMangoScriptWithRSAEncryptedBase64String:"), script);
                NSLog(@"eval remote script success!");
            }
            else {
                NSLog(@"script is null or empty");
            }
        }
        else {
            NSLog(@"file not exist!");
        }
    }];
}

- (void)evalLocalMangoScript {
        
    if ([EDUtils stringIsEmpty:_privateKey]) {
        NSLog(@"privateKey is null or empty");
        return;
    }
    
    id context = ((id (*) (id, SEL))objc_msgSend)(objc_getClass("MFContext"), sel_registerName("alloc"));
    ((void (*) (id, SEL, NSString *))objc_msgSend)(context, sel_registerName("initWithRSAPrivateKey:"), _privateKey);
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"encrypted_demo" ofType:@"mg"];
    NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if (script && script.length > 0) {
        ((void (*) (id, SEL, NSString *))objc_msgSend)(context, sel_registerName("evalMangoScriptWithRSAEncryptedBase64String:"), script);
        NSLog(@"eval local script success!");
    }
    else {
        NSLog(@"script is null or empty");
    }
}

- (NSString*)fixFileDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString*)bundleShortVersion {
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict valueForKey:@"CFBundleShortVersionString"];
}

- (NSString*)mangoFixPatchUrl {
    
    if (![EDUtils stringIsEmpty:_baseUrl] && ![EDUtils stringIsEmpty:_patchUrlPath]) {
        return [NSString stringWithFormat:@"%@%@", _baseUrl, _patchUrlPath];
    }
    else if (![EDUtils stringIsEmpty:_baseUrl]) {
        return [NSString stringWithFormat:@"%@%@", _baseUrl, ED_MANGOFIX_PATCH_URL_PATH];
    }
    return ED_MANGOFIX_GETMANGOFILE_URL;
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
        [self remoteMangoFixFileWithCompletion:completion];
    }
}

- (void)remoteMangoFixFileWithCompletion:(CompleteBlock)completion
{
    __weak typeof(self) weakSelf = self;
    
    NSURL *url = [NSURL URLWithString:[self mangoFixPatchUrl]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSString *bodyString = [NSString stringWithFormat:@"appid=%@&version=%@&debug=%@", _appId, [self bundleShortVersion], @(_debug)];
    request.HTTPBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //后台定义返回statusCode，以实际情况为准
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if (data && httpResponse.statusCode == weakSelf.statusCode) {
            
            NSString *cachesPath = [self fixFileDirectory];
            NSString *filePath = [cachesPath stringByAppendingPathComponent:@"demo.mg"];
            
            if ([data writeToFile:filePath atomically:YES]) {
                NSLog(@"remote file save success!");
                if (data.length > 0 && completion) {
                    completion(nil);
                }
            }
            else {
                NSLog(@"remote file save fail!");
            }
        }
        if (error) {
            NSLog(@"fetch remote file fail, error:%@", error);
        }
    }];
    [task resume];
}

@end
