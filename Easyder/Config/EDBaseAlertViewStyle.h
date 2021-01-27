//
//  EDBaseAlertViewStyle.h
//  Easyder
//
//  Created by mac on 2021/1/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseAlertViewStyle : NSObject

//背景颜色透明度，默认0.7
@property (nonatomic, assign) CGFloat backgroundColorAlpha;
//是否有动画，默认YES
@property (nonatomic, assign) BOOL animated;
//点击蒙版是否隐藏，默认NO
@property (nonatomic, assign) BOOL clickMaskWithHidden;

@end

NS_ASSUME_NONNULL_END
