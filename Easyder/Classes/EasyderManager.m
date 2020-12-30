//
//  EasyderManager.m
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import "EasyderManager.h"
#import <EDBaseMacroDefine.h>

static EasyderManager *manager = nil;

@implementation EasyderManager

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[EasyderManager alloc] init];
        [manager initialize];
    });
    return manager;
}

- (void)initialize {
    
    _widthRatio = SCREEN_W/375.0;
    _heightRatio = SCREEN_H/667.0;
    _themeColor = EDWhiteColor;
}

- (void)makeNavigationConfiguration:(EDConfigurationBlock)configurationBlock {
    
    _navigationConfiguration = [[EDConfiguration alloc] init];
    
    if (configurationBlock) {
        configurationBlock(_navigationConfiguration);
    }
}

@end
