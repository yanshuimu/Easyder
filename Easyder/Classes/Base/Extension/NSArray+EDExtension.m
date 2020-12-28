//
//  NSArray+EDExtension.m
//  AnJiaKe
//
//  Created by apple on 2020/5/31.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "NSArray+EDExtension.h"

@implementation NSArray (EDExtension)

- (NSArray*)getAllValuesWithKey:(NSString*)key {
    
    NSMutableArray *mutaArray = [NSMutableArray array];
    for (NSDictionary *dict in self) {
        [mutaArray addObject:dict[key]];
    }
    return mutaArray;
}

@end
