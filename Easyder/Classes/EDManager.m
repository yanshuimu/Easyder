//
//  EDManager.m
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import "EDManager.h"

static EDManager *manager = nil;

@implementation EDManager

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[EDManager alloc] init];
        [manager initialize];
    });
    return manager;
}

- (void)initialize {
    
    _widthRatio = SCREEN_W/375.0;
    _heightRatio = SCREEN_H/667.0;
}

@end
