//
//  KeyChainUtil.h
//  Easyder
//
//  Created by xuhonggui on 2018/9/13.
//  Copyright © 2018年 xuhonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDKeyChainUtil : NSObject

/**
 * 以key-value键值对储存至钥匙串
 */
+ (void)setString:(NSString*)string forKey:(NSString*)key;

/**
 * 生成base64加密字符串value，再以key-value键值对储存至钥匙串
 */
+ (void)setStringWithBase64Encryption:(NSString*)string forKey:(NSString*)key;

/**
 * 根据key从钥匙串中获取对应的value
 */
+ (NSString*)stringForKey:(NSString*)key;

/**
 * 根据key从钥匙串中获取对应的value，再经过base64解密
 */
+ (NSString*)stringForKeyWithBase64Decryption:(NSString*)key;

/**
 * 移除key-value键值对
 */
+ (void)removeItemForKey:(NSString*)key;

@end
