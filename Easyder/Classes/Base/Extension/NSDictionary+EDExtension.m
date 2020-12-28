//
//  NSDictionary+EDExtension.m
//  AnJiaKe
//
//  Created by apple on 2020/5/25.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "NSDictionary+EDExtension.h"

@implementation NSDictionary (EDExtension)

- (NSDictionary*)replaceNullValueWithEmptyString
{
    NSMutableDictionary *mutaDict = [NSMutableDictionary dictionary];
    NSArray *allKeys = self.allKeys;
    for (NSString *key in allKeys)
    {
        id value = self[key];
        if ([value isKindOfClass:NSNull.class]) {
            [mutaDict setValue:@"" forKey:key];
        }
        else if ([value isKindOfClass:NSDictionary.class]) {
            value = [value replaceNullValueWithEmptyString];
            [mutaDict setValue:value forKey:key];
        }
        else {
            [mutaDict setValue:value forKey:key];
        }
    }
    return mutaDict;
}

@end
