//
//  EDNavigationControllerStyle.m
//  Easyder
//
//  Created by xuhonggui on 2021/1/26.
//

#import "EDNavigationControllerStyle.h"

@implementation EDNavigationControllerStyle

- (instancetype)init
{
    if (self = [super init]) {
        
        _barTintColor = [UIColor whiteColor];
        _barTitleFont = [UIFont systemFontOfSize:17];
        _barTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        
        _itemTintColor = [UIColor whiteColor];
        _itemTitleFont = [UIFont systemFontOfSize:17];
        _itemTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        
        _bottomLineColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        _bottomLineHidden = NO;
        
        _returnButtonOffsetX = 5;
    }
    return self;
}

@end
