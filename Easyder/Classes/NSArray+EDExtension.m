//
//  NSArray+EDExtension.m
//  AnJiaKe
//
//  Created by apple on 2020/5/31.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "NSArray+EDExtension.h"

@implementation NSArray (EDExtension)

- (NSArray*)allValuesWithKey:(NSString*)key {
    
    NSMutableArray *mutaArray = [NSMutableArray array];
    for (NSDictionary *dict in self) {
        [mutaArray addObject:dict[key]];
    }
    return mutaArray;
}

#pragma mark - 打印日志

///打印数组时会自动调用这个方法,在分类中重写这个方法时,在使用时不需要导入头文件(因重写)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"(\n"];
    for (int i = 0; i < self.count; i++) {
        NSString *lastSymbol = (self.count == i + 1) ? @"":@",";
        id value = self[i];
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@%@\n",tab,[value descriptionWithLocale:locale indent:level + 1],lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@%@%@\n",tab,value,lastSymbol];
        }
    }
    [mStr appendFormat:@"%@)",tab];
    return mStr;
}

@end
