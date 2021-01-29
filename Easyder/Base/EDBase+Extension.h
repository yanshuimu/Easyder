//
//  UIView+EDBase.h
//  Easyder
//
//  Created by mac on 2021/1/8.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "LYEmptyViewHeader.h"
#import "EDConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EDBase)

/*
自动缩放宽高
*/
CGSize CGSizeAutoMake(CGFloat width, CGFloat height);

/*
自动缩放宽度
*/
CGFloat CGWidthAutoMake(CGFloat width);

/*
自动缩放高度
*/
CGFloat CGHeightAutoMake(CGFloat height);

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UIView (EDEmptyView)

- (void)configEmptyPage:(NSInteger)emptyPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(LYActionTapBlock)block;

- (void)configEmptyPage:(NSInteger)emptyPageType hasData:(BOOL)hasData hasMoreData:(BOOL)hasMoreData hasError:(BOOL)hasError reloadButtonBlock:(LYActionTapBlock)block;

- (void)configEmptyPage:(NSInteger)emptyPageType hasData:(BOOL)hasData hasError:(BOOL)hasError offsetY:(CGFloat)offsetY reloadButtonBlock:(LYActionTapBlock)block;

- (void)configEmptyPage:(NSInteger)emptyPageType style:(EDEmptyViewStyle*)style hasData:(BOOL)hasData hasError:(BOOL)hasError offsetY:(CGFloat)offsetY reloadButtonBlock:(LYActionTapBlock)block;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UIView (Loading)

- (MBProgressHUD*)showLoading;

- (MBProgressHUD*)showLoadingMeg:(NSString *)meg;

- (MBProgressHUD*)showLoadingMeg:(NSString *)meg time:(NSUInteger)time;

- (void)hideLoading;

- (void)hideLoadingAfterDelay:(NSTimeInterval)delay;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface MBProgressHUD (EDExtension)

+ (void)showLoading;

+ (void)showLoadingMeg:(NSString *)meg;

+ (void)showLoadingMeg:(NSString *)meg time:(NSUInteger)time;

+ (void)hideLoading;

+ (void)hideLoadingAfterDelay:(NSTimeInterval)delay;

+ (void)setLoadingUserInterfaceEnable:(BOOL)enable;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@class EDBaseModel;

typedef void(^OptimizeCompletionBlock)(UIImage *sourceImage, UIImage * _Nullable clipedImage, NSError * _Nullable error);

/**
 * App性能优化类别
 */
@interface UIView (EDOptimize)

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UILabel (EDOptimize)

/**
 * 优化图层混合-设置背景颜色
 */
- (void)optimize_setBlendedLayersWithBackgroundColor:(UIColor*)backgroundColor;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UIImageView (EDOptimize)

/**
* 加载网络图片并缓存至model
* 全圆角、圆角颜色白色、默认占位图片
*/
+ (void)optimize_setImageWithURL:(NSString*)url radius:(CGFloat)radius imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model;

/**
 * 加载网络图片并缓存至model
 * 全圆角、默认占位图片
 */
+ (void)optimize_setImageWithURL:(NSString*)url radius:(CGFloat)radius cornersColor:(UIColor*)cornersColor imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model;

/**
 * 加载网络图片并缓存至model
 * 全圆角、圆角颜色白色
 */
+ (void)optimize_setImageWithURL:(NSString*)url placeholder:(UIImage*)placeholder radius:(CGFloat)radius imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model;

/**
* 离屏渲染优化-生成带圆角图片
* url、targetSize、parentColor、
*/
+ (void)optimize_setImageWithURL:(NSString*)url targetSize:(CGSize)targetSize parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 * 图层混合优化-设置指定圆角背景颜色
 * parentColor 父视图背景颜色
 */
- (void)optimize_setBackgoundColor:(UIColor*)backgroundColor parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 * 图层混合优化-重绘设置指定圆角带透明通道图片
 * parentColor 父视图背景颜色
 */
- (void)optimize_setRedrawAlphaImage:(UIImage*)image parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 * 图层混合优化-重绘设置带透明通道图片
 * parentColor 父视图背景颜色
 */
- (void)optimize_setRedrawAlphaImage:(UIImage*)image parentColor:(UIColor*)parentColor;

/**
 * 图层混合优化-重绘设置指定圆角图片
 * parentColor 父视图背景颜色
 */
- (void)optimize_setRedrawImage:(UIImage*)image parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 * 离屏渲染优化-生成带圆角图片
 * parentColor 父视图背景颜色
 */
- (void)optimize_setImageWithURL:(NSString*)url parentColor:(UIColor*)parentColor radius:(CGFloat)radius;

- (void)optimize_setImageWithURL:(NSString*)url targetSize:(CGSize)targetSize parentColor:(UIColor*)parentColor radius:(CGFloat)radius complete:(OptimizeCompletionBlock)complete;

/**
* 离屏渲染优化-生成带圆角图片
* url、targetSize、parentColor、
*/
- (void)optimize_setImageWithURL:(NSString*)url targetSize:(CGSize)targetSize parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius complete:(OptimizeCompletionBlock)complete;

/**
 * 离屏渲染优化-生成带圆角图片
 * parentColor 父视图背景颜色
 */
- (void)optimize_setImageWithURL:(NSString*)url placeholderImage:(UIImage*)image parentColor:(UIColor*)parentColor radius:(CGFloat)radius;

/**
 * 离屏渲染优化-生成圆形、指定边框图片
 */
- (void)optimize_setBorderRoundedImageWithURL:(NSString*)url parentColor:(UIColor*)parentColor borderColor:(UIColor*)borderColor borderWidth:(CGFloat)borderWidth;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UIView (EDCreate)

/**
 * backgroundColor
 */
+ (instancetype)viewWithBackgroundColor:(UIColor*)backgroundColor;

/**
 * frame
 */
+ (instancetype)viewWithFrame:(CGRect)frame;

/**
 * frame、backgroundColor
 */
+ (instancetype)viewWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor;

/**
 * frame、backgroundColor、cornerRadius
 */
+ (instancetype)viewWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

typedef void(^NetResponse)(id responseObject);

@interface NSObject (Network)

/**
 * Post，成功不显示提示信息
 */
- (void)requestPostWithParams:(id)params url:(NSString *)url response:(NetResponse)response;

/**
 * Post
 */
- (void)requestPostWithParams:(id)params url:(NSString *)url showMsg:(BOOL)showMsg response:(NetResponse)response;

/**
 * Post，参数通过httpBody传递，成功不显示提示信息
 */
- (void)requestPostWithBodyParams:(id)params url:(NSString *)url response:(NetResponse)response;

/**
 * Post，参数通过httpBody传递
 */
- (void)requestPostWithBodyParams:(id)params url:(NSString *)url showMsg:(BOOL)showMsg response:(NetResponse)response;

/**
 * Post，分页
 */
- (void)requestPaginationWithParams:(id)params url:(NSString *)url reloadSelector:(SEL)reloadSelector response:(NetResponse)response;

/**
 * Post，分页，参数通过httpBody传递
 */
- (void)requestPaginationWithBodyParams:(id)params url:(NSString *)url reloadSelector:(SEL)reloadSelector response:(NetResponse)response;

@end

NS_ASSUME_NONNULL_END
