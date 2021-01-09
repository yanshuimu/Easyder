//
//  KeyChainUtil.h
//  Easyder
//
//  Created by mac on 2018/9/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainUtil : NSObject

/**
 * setter
 */
+ (void)setString:(NSString*)string forKey:(NSString*)key;

/**
 * setter（base64加密）
 */
+ (void)setStringWithBase64Encryption:(NSString*)string forKey:(NSString*)key;

/**
 * getter
 */
+ (NSString*)stringForKey:(NSString*)key;

/**
 * getter（base解密）
 */
+ (NSString*)stringForKeyWithBase64Decryption:(NSString*)key;

/**
 * 移除
 */
+ (void)removeItemForKey:(NSString*)key;

@end
