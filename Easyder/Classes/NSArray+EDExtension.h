//
//  NSArray+EDExtension.h
//  AnJiaKe
//
//  Created by apple on 2020/5/31.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (EDExtension)

/**
  遍历数组元素，获取key对应的所有value
 */
- (NSArray*)allValuesWithKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
