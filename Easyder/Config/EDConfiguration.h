//
//  EDConfiguration.h
//  Easyder
//
//  Created by mac on 2020/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 全局配置，优先级比示例属性低
@interface EDConfiguration : NSObject

#pragma mark - EDNavigationController
//背景色，默认白色
@property (nonatomic, strong) UIColor *barTintColor;
//标题颜色，默认黑色
@property (nonatomic, strong) UIColor *barTitleColor;
//标题字号，默认17
@property (nonatomic, strong) UIFont *barTitleFont;
//返回按钮图片
@property (nonatomic, copy) NSString *barReturnImageName;
//底部线条是否隐藏，默认NO
@property (nonatomic, assign) BOOL barBottomLineHidden;

#pragma mark - EDBaseAlertView
//背景颜色透明度
@property (nonatomic, assign) CGFloat backgroundColorAlpha;
//是否有动画，默认NO
@property (nonatomic, assign) BOOL alertViewAnimated;
//点击蒙版是否隐藏，默认NO
@property (nonatomic, assign) BOOL alertViewClickMaskOnTheHidden;

#pragma mark - LYEmptyView
//空态图片
@property (nonatomic, copy) NSString *emptyImageName;
//网络出错图片
@property (nonatomic, copy) NSString *networkErrorImageName;
//标题
@property (nonatomic, copy) NSString *emptyTitle;
//标题字体
@property (nonatomic, strong) UIFont *emptyTitleFont;
//标题字体颜色
@property (nonatomic, strong) UIColor *emptyTitleColor;
//按钮标题
@property (nonatomic, copy) NSString *emptyButtonTitle;
//网络错误提示
@property (nonatomic, copy) NSString *networkErrorTitle;
//按钮标题颜色
@property (nonatomic, strong) UIColor *emptyButtonTitleColor;
//按钮背景颜色
@property (nonatomic, strong) UIColor *emptyButtonBackgroundColor;
@end

NS_ASSUME_NONNULL_END
