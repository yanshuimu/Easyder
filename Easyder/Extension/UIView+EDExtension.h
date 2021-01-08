//
//  UIView+EDExtension.h
//  EasyderDemo
//
//  Created by mac on 2020/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EDLayout)

@property (assign, nonatomic) CGFloat top;

@property (assign, nonatomic) CGFloat bottom;

@property (assign, nonatomic) CGFloat left;

@property (assign, nonatomic) CGFloat right;

@property (assign, nonatomic) CGPoint origin;

@property (assign, nonatomic) CGFloat centerX;

@property (assign, nonatomic) CGFloat centerY;

@property (assign, nonatomic) CGFloat width;

@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGSize size;

@end





















































#pragma mark - 设置圆角

@interface UIView (EDCore)


/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;


@end



















































#pragma mark - 其他

@interface UIView (EDUtils)

/**
 * 获取该视图的控制器
 */
- (UIViewController*)viewController;

/**
 * 添加触碰事件
 */
- (void)addTarget:(id)target action:(SEL)action;

/**
 * 移除所有子视图
 */
- (void)removeChildViews;

/**
 * 自适应大小
 */
- (CGSize)autoFitSize;

@end

NS_ASSUME_NONNULL_END
