//
//  UIImage+Extension.m
//  TT
//
//  Created by xuhonggui on 2018/2/11.
//  Copyright © 2018年 xuhonggui. All rights reserved.
//

#import "UIImage+EDExtension.h"

@implementation UIImage (EDOptimize)

- (instancetype)redrawWithBackgroundColor:(UIColor*)backgroundColor {
        
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    //设置不透明
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    //设置背景颜色
    [backgroundColor setFill];
    UIRectFill(rect);

    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (instancetype)redrawWithRoundedCorners:(UIRectCorner)corners
                                  radius:(CGFloat)radius
                         backgroundColor:(UIColor*)backgroundColor {
        
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    //设置不透明
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    //设置背景颜色
    [backgroundColor setFill];
    UIRectFill(rect);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    [path addClip];
    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (instancetype)imageWithRoundedSize:(CGSize)roundedSize backgroundColor:(UIColor*)backgroundColor corners:(UIRectCorner)corners radius:(CGFloat)radius  {
    
    CGFloat tempWidth = 0.0;
    CGFloat tempHeight = 0.0;
    CGRect rect = CGRectZero;
    
    if (self.size.width/roundedSize.width <= self.size.height/roundedSize.height) {
        
        //宽度铺满，高度等比例放大
        tempWidth = self.size.width;
        tempHeight = roundedSize.height * self.size.width/roundedSize.width;
    }
    else if (self.size.width/roundedSize.width > self.size.height/roundedSize.height) {
        
        //高度铺满，宽度等比例放大
        tempHeight = self.size.height;
        tempWidth = roundedSize.width * self.size.height/roundedSize.height;
    }
    
    rect = CGRectMake(0, 0, tempWidth, tempHeight);
    
    //设置画布大小
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tempWidth, tempHeight), YES, 0);
    
    //设置背景颜色
    [backgroundColor setFill];
    UIRectFill(rect);
    
    //设置路径
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    [path addClip];
    
    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation UIImage (EDUtils)

- (UIImage *)circleImage {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)scaleToSize:(CGSize)newsize {
    
    UIGraphicsBeginImageContextWithOptions(newsize, NO, 1.8);
    [self drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UIImage*)alignBottomWithSize:(CGSize)size {
    
    if (self.size.height < [UIScreen mainScreen].bounds.size.height) {
        return self;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    
    CGFloat height = self.size.height;
    CGFloat width = self.size.width;

    //图片根据目标尺寸缩放后的尺寸
    CGFloat scaleHeight = (size.width/width) * height;
    CGFloat scaleWidth = size.width;

    //开始位置
    CGFloat y = (size.height - scaleHeight);

    [self drawInRect:CGRectMake(0, y, scaleWidth, scaleHeight)];
    
    UIImage* tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *data = UIImageJPEGRepresentation(tempImage, 1.0);
    return [UIImage imageWithData:data];
}

+ (UIImage*)resizableImageWithCapInsets:(UIImage*)originImage {
    
    CGFloat top = originImage.size.height * 0.5;
    CGFloat left = originImage.size.width * 0.5;
    CGFloat bottom = originImage.size.height * 0.5;
    CGFloat right = originImage.size.width * 0.5;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    return [originImage resizableImageWithCapInsets:edgeInsets];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
