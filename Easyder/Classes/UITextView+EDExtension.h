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

- (void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor;

@end



















































@interface UITextView (EDCreate)

+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font;

+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder;

+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder placeholderColor:(UIColor*)placeholderColor;

@end
