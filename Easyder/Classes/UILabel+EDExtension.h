//
//  UILabel+Extension.h
//  RedWine
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font;

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor;

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor;

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor;


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
