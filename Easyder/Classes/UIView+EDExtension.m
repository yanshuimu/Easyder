//
//  UIView+EDExtension.m
//  EasyderDemo
//
//  Created by mac on 2020/12/25.
//

#import "UIView+EDExtension.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <EDBaseMacroDefine.h>

#define kDefaultShowTime 1.5

#pragma mark - Loading

@implementation UIView (Loading)

- (MBProgressHUD*)showLoading
{
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    
    MBProgressHUD *hudView = [MBProgressHUD HUDForView:self];
    if (!hudView) {
        hudView = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    else
    {
        [self bringSubviewToFront:hudView];
        [hudView showAnimated:YES];
    }
    hudView.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hudView.bezelView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    return hudView;
}

- (MBProgressHUD*)showLoadingMeg:(NSString *)meg
{
    MBProgressHUD *hudView = [self showLoadingMeg:meg time:kDefaultShowTime];
    return hudView;
}

- (MBProgressHUD*)showLoadingMeg:(NSString *)meg time:(NSUInteger)time
{
    
    MBProgressHUD *hudView = [MBProgressHUD HUDForView:self];
    if (!hudView) {
        hudView = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    else
    {
        [hudView showAnimated:YES];
    }
    hudView.margin = 12;
    hudView.mode = MBProgressHUDModeText;
    hudView.detailsLabel.text = meg;
    hudView.detailsLabel.font = EDFont(13);
    hudView.detailsLabel.textColor = [UIColor whiteColor];
    hudView.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hudView.bezelView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    if (time > 0) {
        [self performSelector:@selector(hideLoading) withObject:nil afterDelay:time];
    }
    return hudView;
}

- (void)showLoadingMeg:(NSString *)meg withImageName:(NSString *)imageName time:(NSUInteger)time
{
    MBProgressHUD *hud = [self showLoadingMeg:meg];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

- (void)hideLoading
{
    [MBProgressHUD hideHUDForView:self animated:NO];
}

- (void)delayHideLoading
{
    [self performSelector:@selector(hideLoading) withObject:nil afterDelay:kDefaultShowTime];
}

- (void)hideLoadingAfterDelay:(NSTimeInterval)delay
{
    [self performSelector:@selector(hideLoading) withObject:nil afterDelay:delay];
}

- (void)setLoadingUserInterfaceEnable:(BOOL)enable
{
    [MBProgressHUD HUDForView:self].userInteractionEnabled = enable;
}

@end

#pragma mark - 设置圆角

@implementation UIView (EDCore)

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

@end

@implementation UIView (EDExtension)

- (UIView*)addLineWithFrame:(CGRect)frame backgroundColor:(UIColor*)color {
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    [self addSubview:view];
    return view;
}

- (void)removeChildViews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

@end
