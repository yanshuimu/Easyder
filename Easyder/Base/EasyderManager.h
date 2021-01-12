//
//  EasyderManager.h
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import <Foundation/Foundation.h>
#import "EDConfiguration.h"
#import "EDMoninNet.h"

#define EDManagerSingleton [EasyderManager shareManager]

NS_ASSUME_NONNULL_BEGIN

typedef void(^EDConfigurationBlock)(EDConfiguration  * _Nullable configuration);

@interface EasyderManager : NSObject

+ (instancetype)shareManager;

//网络状态监听
@property (nonatomic, strong) EDMoninNet *moninNet;
//水平缩放比例
@property (nonatomic, assign) CGFloat widthRatio;
//垂直缩放比例
@property (nonatomic, assign) CGFloat heightRatio;
//主题色，默认白色
@property (nonatomic, strong) UIColor *themeColor;
//
@property (nonatomic, strong) EDConfiguration *navigationConfiguration;
//
@property (nonatomic, strong) EDConfiguration *alertViewConfiguration;
//
@property (nonatomic, strong) EDConfiguration *emptyViewConfiguration;

/**
 * 全局配置EDNavigationController
 */
- (void)makeNavigationConfiguration:(EDConfigurationBlock)configurationBlock;

/**
 * 全局配置EDBaseAlertView
 */
- (void)makeAlertViewConfiguration:(EDConfigurationBlock)configurationBlock;

/**
 * 全局配置LYEmptyView
 */
- (void)makeEmptyViewConfiguration:(EDConfigurationBlock)configurationBlock;

@end

NS_ASSUME_NONNULL_END
