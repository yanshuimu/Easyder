//
//  UIImageView+EDCreate.m
//  VClub
//
//  Created by mac on 2020/11/21.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UIImageView+EDExtension.h"
#import "UIView+EDExtension.h"

@implementation UIImageView (EDCreate)

+ (instancetype)imageViewWithFrame:(CGRect)frame isScaleAspectFill:(BOOL)isScaleAspectFill {
    
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    imageView.contentMode = isScaleAspectFill ? UIViewContentModeScaleAspectFill : UIViewContentModeScaleAspectFill;
    return imageView;
}

+ (instancetype)imageViewWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor {
    
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    imageView.backgroundColor = backgroundColor;
    return imageView;
}

+ (instancetype)imageViewWithImageName:(NSString*)imageName {
    
    UIImageView *imageView = [[self alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName {
    
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName isScaleAspectFill:(BOOL)isScaleAspectFill {
    
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = isScaleAspectFill ? UIViewContentModeScaleAspectFill : UIViewContentModeScaleAspectFill;
    return imageView;
}

+ (instancetype)imageViewWithFrame:(CGRect)frame cornerRadius:(CGSize)cornerRadius {
    
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView addRoundedCorners:UIRectCornerAllCorners withRadii:cornerRadius];
    return imageView;
}

+ (instancetype)imageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName cornerRadius:(CGSize)cornerRadius {
    
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView addRoundedCorners:UIRectCornerAllCorners withRadii:cornerRadius];
    return imageView;
}

@end
