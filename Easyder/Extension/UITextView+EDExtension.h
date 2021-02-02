//
//  UITextView+Placeholder.h
//  TT
//
//  Created by xuhonggui on 2018/3/15.
//  Copyright © 2018年 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (EDUtils)

/**
 * 设置占位符
 */
- (void)setPlaceholder:(NSString *)placeholder placeholdColor:(UIColor *)placeholdColor;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UITextView (EDCreate)

/**
 * frame、font
 */
+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font;

/**
 * frame、font、placeholder
 */
+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder;

/**
 * frame、font、placeholder、placeholderColor
 */
+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder placeholderColor:(UIColor*)placeholderColor;

@end
