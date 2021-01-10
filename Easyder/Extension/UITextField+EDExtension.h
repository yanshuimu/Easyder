//
//  UITextField+Extension.h
//  Kehouyi
//
//  Created by apple on 2019/8/4.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (EDUtils)

/**
 * 设置占位符
 */
- (void)setPlaceholder:(NSString*)placeholder color:(UIColor*)color;

/**
 * 创建左边视图
 */
- (UIView*)createLeftViewWithFrame:(CGRect)frame;

/**
 * 创建右边视图
 */
- (UIView*)createRightViewWithFrame:(CGRect)frame;

@end



















































@interface UITextField (EDCreate)

/**
 * font
 */
+ (instancetype)textFieldWithFont:(UIFont*)font;

/**
 * font、placeholder
 */
+ (instancetype)textFieldWithFont:(UIFont*)font placeholder:(NSString*)placeholder;

/**
 * frame、font
 */
+ (instancetype)textFieldWithFrame:(CGRect)frame font:(UIFont*)font;

/**
 * frame、font、placeholder
 */
+ (instancetype)textFieldWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder;

@end
