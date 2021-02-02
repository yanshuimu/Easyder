//
//  UIImageView+EDCreate.h
//  Easyder
//
//  Created by xuhonggui on 2020/11/21.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (EDCreate)

/**
 * frame、isScaleAspectFill
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame isScaleAspectFill:(BOOL)isScaleAspectFill;

/**
 * frame、backgroundColor
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor;

/**
 * imageName
 */
+ (instancetype)imageViewWithImageName:(NSString*)imageName;

/**
 * frame、imageName
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName;

/**
 * frame、imageName、isScaleAspectFill
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName isScaleAspectFill:(BOOL)isScaleAspectFill;

/**
 * frame、cornerRadius
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame cornerRadius:(CGSize)cornerRadius;

/**
 * frame、imageName、cornerRadius
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName cornerRadius:(CGSize)cornerRadius;

@end

NS_ASSUME_NONNULL_END
