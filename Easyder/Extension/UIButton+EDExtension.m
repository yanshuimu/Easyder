//
//  UIButton+EDCreate.m
//  VClub
//
//  Created by 许鸿桂 on 2020/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UIButton+EDExtension.h"
#import "UIView+EDExtension.h"
#import "UIColor+EDExtension.h"

@implementation UIButton (EDCreate)

+ (instancetype)buttonWithImageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font imageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:EDFontColorBlack forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor imageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    btn.layer.cornerRadius = cornerRadius;
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame imageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame font:(UIFont*)font titleColor:(UIColor*)titleColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGSize)cornerRadius {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.backgroundColor = backgroundColor;
    [btn addRoundedCorners:UIRectCornerAllCorners withRadii:cornerRadius];
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(cornerRadius, cornerRadius)];
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor imageName:(NSString*)imageName backgroundImageName:(NSString*)backgroundImageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    return btn;
}

@end
