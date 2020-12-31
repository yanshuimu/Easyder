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
 * frame、font、backgroundColor
 */
+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor;

/**
 * frame、font、textColor、backgroundColor
 */
+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor;

/**
 * frame、text、font、textColor
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont*)font textColor:(UIColor *)textColor;

/**
 * font
 */
+ (instancetype)labelWithFont:(UIFont *)font;

/**
 * text、font
 */
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font;

/**
 * font、textColor
 */
+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor;

/**
 * font、textColor、backgroundColor
 */
+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor;

/**
 * text、font、textColor
 */
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

/**
* text、font、textColor、backgroundColor、cornerRadius
*/
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius;

@end
