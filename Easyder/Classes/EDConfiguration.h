//
//  EDConfiguration.h
//  Easyder
//
//  Created by mac on 2020/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDConfiguration : NSObject

#pragma mark - EDNavigationController
//导航栏背景色，默认白色
@property (nonatomic, strong) UIColor *barTintColor;
//导航栏标题颜色，默认黑色
@property (nonatomic, strong) UIColor *barTitleColor;
//导航栏标题字号，默认17
@property (nonatomic, strong) UIFont *barTitleFont;
//导航栏底部线条是否隐藏，默认NO
@property (nonatomic, assign) BOOL barBottomLineHidden;
@end

NS_ASSUME_NONNULL_END
