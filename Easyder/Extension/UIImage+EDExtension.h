//
//  UIImage+Extension.h
//  TT
//
//  Created by mac on 2018/2/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (EDOptimize)

/**
 * 重绘图片，设置背景颜色，去除透明通道
 */
- (instancetype)redrawWithBackgroundColor:(UIColor*)backgroundColor;

/**
 * 重绘图片，设置背景颜色，指定圆角，去除透明通道
 */
- (instancetype)redrawWithRoundedCorners:(UIRectCorner)corners
                                  radius:(CGFloat)radius
                         backgroundColor:(UIColor*)backgroundColor;

/**
 * 根据父视图尺寸生成带圆角、背景颜色、去除透明通道图片
 */
- (instancetype)imageWithRoundedSize:(CGSize)roundedSize
                     backgroundColor:(UIColor*)backgroundColor
                             corners:(UIRectCorner)corners
                              radius:(CGFloat)radius;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UIImage (EDUtils)

/**
 * 裁剪成圆形
 */
- (UIImage *)circleImage;

/**
 * 改变尺寸
 */
- (UIImage*)scaleToSize:(CGSize)newsize;

/**
 * 裁剪图片，只裁剪顶部
 */
- (UIImage*)alignBottomWithSize:(CGSize)size;

/**
 * 图片拉伸
 */
+ (UIImage*)resizableImageWithCapInsets:(UIImage*)originImage;

/**
 * UIColor生成UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
