//
//  EDEmptyViewStyle.h
//  Easyder
//
//  Created by xuhonggui on 2021/1/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ConditionsBlock)(NSInteger emptyPageType);

@interface EDEmptyViewStyle : NSObject

//空态图片
@property (nonatomic, copy) NSString *imageName;
//网络出错图片
@property (nonatomic, copy) NSString *networkErrorImageName;
//网络出错按钮标题
@property (nonatomic, copy) NSString *networkErrorButtonTitle;
//标题
@property (nonatomic, copy) NSString *title;
//标题字体
@property (nonatomic, strong) UIFont *titleFont;
//标题字体颜色
@property (nonatomic, strong) UIColor *titleColor;
//按钮标题
@property (nonatomic, copy) NSString *buttonTitle;
//网络错误提示
@property (nonatomic, copy) NSString *networkErrorTitle;
//按钮标题颜色
@property (nonatomic, strong) UIColor *buttonTitleColor;
//按钮标题字体
@property (nonatomic, strong) UIFont *buttonTitleFont;
//按钮背景颜色
@property (nonatomic, strong) UIColor *buttonBackgroundColor;
//按钮高度，默认40.0
@property (nonatomic, assign) CGFloat buttonHeight;
//按钮圆角，默认5.0
@property (nonatomic, assign) CGFloat buttonCornerRadius;
//按钮边框，默认0.0
@property (nonatomic, assign) CGFloat buttonBorderWidth;
//按钮边框颜色，默认nil
@property (nonatomic, strong) UIColor *buttonBorderColor;
//
@property (nonatomic, copy) ConditionsBlock conditionsBlock;
@end

NS_ASSUME_NONNULL_END
