//
//  EasyderManager.h
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import <Foundation/Foundation.h>
#import <EDConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^EDConfigurationBlock)(EDConfiguration  * _Nullable configuration);

@interface EasyderManager : NSObject

+ (instancetype)shareManager;

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

- (void)makeNavigationConfiguration:(EDConfigurationBlock)configurationBlock;

- (void)makeAlertViewConfiguration:(EDConfigurationBlock)configurationBlock;

@end

NS_ASSUME_NONNULL_END
