//
//  EDBaseAlertViewStyle.m
//  Easyder
//
//  Created by mac on 2021/1/27.
//

#import "EDBaseAlertViewStyle.h"

@implementation EDBaseAlertViewStyle

- (instancetype)init {
    if (self = [super init]) {
        
        _backgroundColorAlpha = 0.70;
        _animated = YES;
        _clickMaskWithHidden = NO;
    }
    return self;
}

@end
