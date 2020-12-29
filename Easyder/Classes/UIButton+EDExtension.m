//
//  UIButton+EDCreate.m
//  VClub
//
//  Created by 许鸿桂 on 2020/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UIButton+EDExtension.h"
#import <EDBaseMacroDefine.h>
#import <UIView+EDExtension.h>

@implementation UIButton (EDCreate)

+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
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

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font imageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:kFontColorBlack forState:UIControlStateNormal];
    [btn setImage:IMAGENAME(imageName) forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font imageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setImage:IMAGENAME(imageName) forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;

    return btn;
}

+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    btn.layer.cornerRadius = cornerRadius;
    
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame titleColor:(UIColor*)titleColor font:(UIFont*)font {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGSize)cornerRadius {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn addRoundedCorners:UIRectCornerAllCorners withRadii:cornerRadius];
    
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font imageName:(NSString*)imageName backgroundImageName:(NSString*)backgroundImageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setImage:IMAGENAME(imageName) forState:UIControlStateNormal];
    [btn setBackgroundImage:IMAGENAME(backgroundImageName) forState:UIControlStateNormal];
    
    return btn;
}

+ (instancetype)buttonWithImageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:IMAGENAME(imageName) forState:UIControlStateNormal];
    
    return btn;
}

+ (instancetype)buttonWithFrame:(CGRect)frame imageName:(NSString*)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:IMAGENAME(imageName) forState:UIControlStateNormal];
    
    return btn;
}

@end
