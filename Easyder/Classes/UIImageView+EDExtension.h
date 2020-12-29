//
//  UIImageView+EDCreate.h
//  VClub
//
//  Created by mac on 2020/11/21.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (EDCreate)

/**
 * frame
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame;

+ (instancetype)imageViewWithFrame:(CGRect)frame isScaleAspectFill:(BOOL)isScaleAspectFill;

/**
 * frame、backgroundColor
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor;

/**
 * imageName
 */
+ (instancetype)imageViewWithImageName:(NSString*)imageName;

+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName isScaleAspectFill:(BOOL)isScaleAspectFill;

/**
 * frame、imageName
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName;

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
