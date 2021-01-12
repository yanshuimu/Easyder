//
//  EDRequestManager.h
//  common
//
//  Created by SPIWsx on 2017/2/25.
//  Copyright © 2017年 ED. All rights reserved.
//  传入一个 requestEnty，帮你发起网络请求

#import <Foundation/Foundation.h>
#import "EDRequestEnty.h"

@interface EDRequestManager : NSObject

+ (void)requestWithEnty:(EDRequestEnty *)requestEnty;

@end
