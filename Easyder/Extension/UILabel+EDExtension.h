//
//  UILabel+Extension.h
//  RedWine
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 * frame、font
 */
+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font;

/**
 * frame、font、textColor
 */
+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor;

/**
 * frame、font、text、textColor
 */
+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font text:(NSString *)text textColor:(UIColor *)textColor;

/**
 * frame、font、backgroundColor
 */
+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor;

/**
 * frame、font、textColor、backgroundColor
 */
+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor;

/**
 * font
 */
+ (instancetype)labelWithFont:(UIFont *)font;

/**
 * font、text
 */
+ (instancetype)labelWithFont:(UIFont *)font text:(NSString *)text;

/**
 * font、textColor
 */
+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor;

/**
 * font、textColor、backgroundColor
 */
+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor;

/**
 * font、text、textColor
 */
+ (instancetype)labelWithFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor;

/**
 * font、text、textColor、backgroundColor、cornerRadius
 */
+ (instancetype)labelWithFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius;

@end
