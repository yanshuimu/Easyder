//
//  UILabel+Extension.m
//  RedWine
//
//  Created by xuhonggui on 2018/4/24.
//  Copyright © 2018年 xuhonggui. All rights reserved.
//

#import "UILabel+EDExtension.h"
#import "UIColor+EDExtension.h"

@implementation UILabel (Extension)

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = EDFontColorBlack;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = textColor;
    label.font = font;
    label.backgroundColor = backgroundColor;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = EDFontColorBlack;
    label.font = font;
    label.backgroundColor = backgroundColor;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font text:(NSString *)text textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font {
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = EDFontColorBlack;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font text:(NSString *)text {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = EDFontColorBlack;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor {
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = font;
    label.backgroundColor = backgroundColor;
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.backgroundColor = backgroundColor;
    label.layer.cornerRadius = cornerRadius;
    label.layer.masksToBounds = YES;
    return label;
}

@end
