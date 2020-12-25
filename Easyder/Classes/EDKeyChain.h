//
//  EDKeyChain.h
//  DCAMP
//
//  Created by easyder on 17/6/8.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
#define KEY_PHONE_ACCOUNT  @"com.tt.app.phoneAccount"
#define KEY_THIRD_WeChat_ACCOUNT  @"com.tt.app.weChatAccount"
#define KEY_USERNAME_PASSWORD  @"com.kylinConsumer.app.pwd"
#define KEY_USERNAME_IDENTITY  @"com.kylinConsumer.app.identity"

@interface EDKeyChain : NSObject

+ (void)saveObjectData:(id)data keyService:(NSString *)service;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;


@end
