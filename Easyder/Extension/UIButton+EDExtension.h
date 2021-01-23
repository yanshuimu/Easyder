//
//  UIButton+EDCreate.h
//  VClub
//
//  Created by 许鸿桂 on 2020/11/20.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EDCreate)

/**
 * imageName
 */
+ (instancetype)buttonWithImageName:(NSString*)imageName;

/**
* title、font、imageName
*/
+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font imageName:(NSString*)imageName;

/**
 * title、titleColor、font
 */
+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor;

/**
* title、font、titleColor、imageName
*/
+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor imageName:(NSString*)imageName;

/**
 * title、font、titleColor、backgroundColor
 */
+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor;

/**
 * title、font、titleColor、backgroundColor、cornerRadius
 */
+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius;

/**
* frame、imageName
*/
+ (instancetype)buttonWithFrame:(CGRect)frame imageName:(NSString*)imageName;

/**
 * frame、backgroundColor、cornerRadius
 */
+ (instancetype)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGSize)cornerRadius;

/**
 * frame、title、font、titleColor
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor;

/**
 * frame、font、titleColor
 */
+ (instancetype)buttonWithFrame:(CGRect)frame font:(UIFont*)font titleColor:(UIColor*)titleColor;

/**
 * frame、title、font、titleColor、backgroundColor
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor;

/**
 * frame、title、font、titleColor、backgroundColor、cornerRadius
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius;

/**
 * frame、title、font、titleColor、imageName、backgroundImageName
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font titleColor:(UIColor*)titleColor imageName:(NSString*)imageName backgroundImageName:(NSString*)backgroundImageName;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UIButton (EDUtils)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
