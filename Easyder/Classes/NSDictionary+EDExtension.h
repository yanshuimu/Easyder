//
//  NSDictionary+EDExtension.h
//  AnJiaKe
//
//  Created by apple on 2020/5/25.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (EDUtils)

- (NSDictionary*)replaceNullValueWithWhiteString;

@end

















































#pragma mark - 防止删除崩溃

@interface NSDictionary (DeleteNull)

+ (id)changeType:(id)myObj;

@end

NS_ASSUME_NONNULL_END
