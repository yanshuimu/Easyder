//
//  NSDictionary+EDExtension.h
//  AnJiaKe
//
//  Created by apple on 2020/5/25.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (EDExtension)

- (NSDictionary*)replaceNullValueWithEmptyString;

@end

NS_ASSUME_NONNULL_END
