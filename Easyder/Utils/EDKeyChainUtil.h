//
//  KeyChainUtil.h
//  MYYProject
//
//  Created by mac on 2018/9/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainUtil : NSObject

/**
 保存密码
 */
+ (void)saveLoginPassword:(NSString*)password username:(NSString*)username;

/**
 读取密码
 */
+ (NSString*)getLoginPassword:(NSString*)username;

/**
 删除密码
 */
+ (void)clearLoginPassword:(NSString*)username;

@end
