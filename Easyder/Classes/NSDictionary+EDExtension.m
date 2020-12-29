//
//  NSDictionary+EDExtension.m
//  AnJiaKe
//
//  Created by apple on 2020/5/25.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "NSDictionary+EDExtension.h"

@implementation NSDictionary (EDUtils)

- (NSDictionary*)replaceNullValueWithWhiteString
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
            value = [value replaceNullValueWithWhiteString];
            [mutaDict setValue:value forKey:key];
        }
        else {
            [mutaDict setValue:value forKey:key];
        }
    }
    return mutaDict;
}

#pragma mark - 打印日志

///打印字典时会自动调用这个方法,在分类中重写这个方法时,在使用时不需要导入头文件(因重写)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"{\n"];
    NSArray *allKey = self.allKeys;
    for (int i = 0; i < allKey.count; i++) {
        id value = self[allKey[i]];
        NSString *lastSymbol = (allKey.count == i + 1) ? @"":@";";
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@ = %@%@\n",tab,allKey[i],[value descriptionWithLocale:locale indent:level + 1],lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@%@ = %@%@\n",tab,allKey[i],value,lastSymbol];
        }
    }
    [mStr appendFormat:@"%@}",tab];
    return mStr;
}

@end
