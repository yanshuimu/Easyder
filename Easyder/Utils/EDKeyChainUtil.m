//
//  KeyChainUtil.m
//  Easyder
//
//  Created by mac on 2018/9/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "EDKeyChainUtil.h"
#import <UICKeyChainStore/UICKeyChainStore.h>
#import "EDUtils.h"

@implementation KeyChainUtil

+ (void)setString:(NSString*)string forKey:(NSString*)key {
    
    if ([EDUtils stringIsEmpty:string] || [EDUtils stringIsEmpty:key]) {
        return;
    }
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[self bundleIdentifier]];
    [keychain setString:string forKey:key];
}

+ (void)setStringWithBase64Encryption:(NSString*)string forKey:(NSString*)key {
    
    NSString *base64String = [EDUtils base64StringFromText:string];
    [self setString:base64String forKey:key];
}

+ (NSString*)stringForKey:(NSString*)key {
    
    if ([EDUtils stringIsEmpty:key]) {
        return @"";
    }
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[self bundleIdentifier]];
    return [keychain stringForKey:key];
}

+ (NSString*)stringForKeyWithBase64Decryption:(NSString*)key {
    
    NSString *base64String = [self stringForKey:key];
    return [EDUtils textFromBase64String:base64String];
}

+ (void)removeItemForKey:(NSString*)key {
    
    if ([EDUtils stringIsEmpty:key]) {
        return;
    }
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[self bundleIdentifier]];
    [keychain removeItemForKey:key];
}

+ (NSString*)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

@end
