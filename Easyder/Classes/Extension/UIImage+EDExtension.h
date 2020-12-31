//
//  UIImage+Extension.h
//  TT
//
//  Created by mac on 2018/2/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (EDUtils)

- (UIImage *)circleImage;

//缩放至指定尺寸
- (UIImage*)scaleToSize:(CGSize)newsize;

- (UIImage*)alignBottomWithSize:(CGSize)size;

// 根据图片url获取图片尺寸
+ (CGSize)getImageSizeWithURL:(id)imageURL;

//图片拉伸
+ (UIImage*)resizableImageWithCapInsets:(UIImage*)originImage;

+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 * 根据父视图尺寸生成带圆角、背景颜色、去除透明通道图片
 */
- (instancetype)imageWithRoundedSize:(CGSize)roundedSize
                     backgroundColor:(UIColor*)backgroundColor
                             corners:(UIRectCorner)corners
                              radius:(CGFloat)radius;

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

@end
