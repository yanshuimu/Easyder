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
* frame、imageName
*/
+ (instancetype)buttonWithFrame:(CGRect)frame imageName:(NSString*)imageName;

/**
* frame、backgroundImageName
*/
+ (instancetype)buttonWithFrame:(CGRect)frame backgroundImageName:(NSString*)backgroundImageName;

/**
 * frame、backgroundColor、cornerRadius
 */
+ (instancetype)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGSize)cornerRadius;

/**
 * frame、title、titleColor、font
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font;

/**
 * title、titleColor、font
 */
+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font;

/**
* title、font、imageName
*/
+ (instancetype)buttonWithTitle:(NSString*)title font:(UIFont*)font imageName:(NSString*)imageName;

/**
* title、titleColor、font、imageName
*/
+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font imageName:(NSString*)imageName;

/**
 * title、titleColor、font、backgroundColor
 */
+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor;

/**
 * title、titleColor、font、backgroundColor、cornerRadius
 */
+ (instancetype)buttonWithTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius;

+ (instancetype)buttonWithFrame:(CGRect)frame titleColor:(UIColor*)titleColor font:(UIFont*)font;

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor;

/**
 * frame、title、titleColor、font、backgroundColor、cornerRadius
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius;

/**
 * frame、title、titleColor、font、imageName、backgroundImageName
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font imageName:(NSString*)imageName backgroundImageName:(NSString*)backgroundImageName;

@end

NS_ASSUME_NONNULL_END
