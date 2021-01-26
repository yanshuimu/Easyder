//
//  EDNavigationConfiguration.m
//  Easyder
//
//  Created by 许鸿桂 on 2021/1/26.
//

#import "EDNavigationConfiguration.h"

@implementation EDNavigationConfiguration

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _barTintColor = [UIColor whiteColor];
        _barTitleFont = [UIFont systemFontOfSize:17];
        _barTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        
        _itemTintColor = [UIColor whiteColor];
        _itemTitleFont = [UIFont systemFontOfSize:17];
        _itemTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        
        _bottomLineColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        _bottomLineHidden = NO;
    }
    return self;
}

@end
