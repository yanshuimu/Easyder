//
//  EDNavigationConfiguration.h
//  Easyder
//
//  Created by 许鸿桂 on 2021/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDNavigationConfiguration : NSObject

//背景色，默认白色
@property (nonatomic, strong) UIColor *barTintColor;
//标题颜色，默认黑色
@property (nonatomic, strong) UIColor *barTitleColor;
//标题字号，默认17
@property (nonatomic, strong) UIFont *barTitleFont;
//按钮背景色，默认白色
@property (nonatomic, strong) UIColor *itemTintColor;
//按钮颜色，默认黑色
@property (nonatomic, strong) UIColor *itemTitleColor;
//按钮字号，默认17
@property (nonatomic, strong) UIFont *itemTitleFont;
//返回按钮图片
@property (nonatomic, copy) NSString *returnImageName;
//底部线条颜色
@property (nonatomic, strong) UIColor *bottomLineColor;
//底部线条是否隐藏，默认NO
@property (nonatomic, assign) BOOL bottomLineHidden;

@end

NS_ASSUME_NONNULL_END
