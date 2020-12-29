//
//  UILabel+Extension.m
//  RedWine
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UILabel+EDExtension.h"
#import <EDBaseMacroDefine.h>

@implementation UILabel (Extension)

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = kFontColorBlack;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = kFontColorBlack;
    label.font = font;
    label.backgroundColor = backgroundColor;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = textColor;
    label.font = font;
    label.backgroundColor = backgroundColor;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont*)font textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)labelWithFont:(UIFont *)font {
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = kFontColorBlack;
    label.font = font;
    return label;
}



+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = kFontColorBlack;
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

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius {
    
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
