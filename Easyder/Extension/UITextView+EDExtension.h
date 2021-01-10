//
//  UITextView+Placeholder.h
//  TT
//
//  Created by mac on 2018/3/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 占位符

@interface UITextView (EDUtils)

- (void)setPlaceholder:(NSString *)placeholder placeholdColor:(UIColor *)placeholdColor;

@end



















































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
