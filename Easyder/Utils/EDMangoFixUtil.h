//
//  EDMangoFix.h
//  MYYManager
//
//  Created by mac on 2020/4/9.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDMangoFixUtil : NSObject

+ (instancetype)sharedInstance;

//基础url
@property (nonatomic, copy) NSString *baseUrl;
//补丁文件相对路径
@property (nonatomic, copy) NSString *patchUrlPath;
//成功状态码，默认201
@property (nonatomic, assign) NSInteger statusCode;
/**
 * 初始化
 */
- (void)startWithAppId:(NSString*)appId privateKey:(NSString*)privateKey;

/**
 * 初始化
 */
- (void)startWithAppId:(NSString*)appId privateKey:(NSString*)privateKey debug:(BOOL)debug;

/**
 * 执行远程补丁
 * 补丁文件名：demo.mg
 */
- (void)evalRemoteMangoScript;

/**
 * 执行本地补丁
 * 补丁文件名：encrypted_demo.mg
 */
- (void)evalLocalMangoScript;

@end

NS_ASSUME_NONNULL_END
