//
//  EDMangoFix.h
//  MYYManager
//
//  Created by mac on 2020/4/9.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDMangoFix : NSObject

+ (instancetype)sharedInstance;

- (void)startWithAppId:(NSString*)appId RSAPrivateKey:(NSString*)RSAPrivateKey debug:(BOOL)debug;

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
