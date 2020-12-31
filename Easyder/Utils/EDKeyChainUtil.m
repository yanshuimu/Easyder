//
//  KeyChainUtil.m
//  MYYProject
//
//  Created by mac on 2018/9/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "EDKeyChainUtil.h"
#import <UICKeyChainStore/UICKeyChainStore.h>
#import "EDUtils.h"
#import "EDBaseMacroDefine.h"

#define kPassword NSSTRING(((char []) {201, 197, 199, 132, 199, 207, 195, 211, 207, 211, 195, 132, 218, 203, 217, 217, 221, 197, 216, 206, 0}))

@implementation KeyChainUtil

/**
 保存密码
 */
+ (void)saveLoginPassword:(NSString*)password username:(NSString*)username
{
    if (EDStringIsEmpty(password) || EDStringIsEmpty(username)) {
        return;
    }
    NSString *base64_password = [EDUtils base64StringFromText:password];
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[[NSBundle mainBundle] bundleIdentifier]];
    NSError *error;
    [keychain setString:base64_password forKey:username error:&error];
    if (error) {
        //NSLog(@"保存密码失败");
    } else {
        //NSLog(@"保存密码成功");
    }
}

/**
 读取密码
 */
+ (NSString*)getLoginPassword:(NSString*)username
{
    if (EDStringIsEmpty(username)) {
        return @"";
    }
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[[NSBundle mainBundle] bundleIdentifier]];
    NSError *error;
    NSString *base64_password = [keychain stringForKey:username error:&error];
    if (error) {
        //NSLog(@"读取密码失败");
        return @"";
    } else {
        //NSLog(@"读取密码成功");
        NSString *password = [EDUtils textFromBase64String:base64_password];
        return password;
    }
    return @"";
}

/**
 删除密码
 */
+ (void)clearLoginPassword:(NSString*)username
{
    if (EDStringIsEmpty(username)) {
        return;
    }
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[[NSBundle mainBundle] bundleIdentifier]];
    NSError *error;
    [keychain setString:@"" forKey:username error:&error];
    if (error) {
        //NSLog(@"清除密码失败");
    } else {
        //NSLog(@"清除密码成功");
    }
}

@end
