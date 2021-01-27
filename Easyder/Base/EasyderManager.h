//
//  EasyderManager.h
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import <Foundation/Foundation.h>
#import "EDMoninNet.h"

#define EDManagerSingleton [EasyderManager shareManager]

NS_ASSUME_NONNULL_BEGIN

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

/**
 * 开始网络监测
 */
- (void)startMoninNet;

/**
 * 停止网络监测
 */
- (void)stopMoninNet;

@end

NS_ASSUME_NONNULL_END
