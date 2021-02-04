//
//  EDCacheUtil.h
//  Easyder
//
//  Created by mac on 2019/11/7.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDCacheUtil : NSObject

/**
 * 计算缓存大小
 * 返回值单位1M
 */
+ (float)calculateCacheSize;

/**
 * 清除缓存
 */
+ (void)clearCache;

@end

NS_ASSUME_NONNULL_END
