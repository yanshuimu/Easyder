//
//  EasyderManager.m
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import "EasyderManager.h"
#import "UIColor+EDExtension.h"

static EasyderManager *manager = nil;

@interface EasyderManager ()

@end

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
    
    _widthRatio = [UIScreen mainScreen].bounds.size.width/375.0;
    _heightRatio = [UIScreen mainScreen].bounds.size.height/667.0;
    _themeColor = [UIColor whiteColor];
}

- (void)startMoninNet {
    
    if (!_moninNet) {
        _moninNet = [[EDMoninNet alloc] init];
    }
    [_moninNet startMoninNet];
}

- (void)stopMoninNet {
    
    [_moninNet stopMoninNet];
}

- (void)makeNavigationConfiguration:(EDConfigurationBlock)configurationBlock {
    
    _navigationConfiguration = [[EDConfiguration alloc] init];
    
    if (configurationBlock) {
        configurationBlock(_navigationConfiguration);
    }
}

- (void)makeAlertViewConfiguration:(EDConfigurationBlock)configurationBlock {
    
    _alertViewConfiguration = [[EDConfiguration alloc] init];
    _alertViewConfiguration.alertViewAnimated = YES;
    
    if (configurationBlock) {
        configurationBlock(_alertViewConfiguration);
    }
}

- (void)makeEmptyViewConfiguration:(EDConfigurationBlock)configurationBlock {
    
    _emptyViewConfiguration = [[EDConfiguration alloc] init];
    
    if (configurationBlock) {
        configurationBlock(_emptyViewConfiguration);
    }
}

@end
