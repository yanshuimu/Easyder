//
//  UIView+EDLayout.h
//  MYYManager
//
//  Created by mac on 2019/4/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
自动缩放宽高
*/
CGSize CGSizeAutoMake(CGFloat width, CGFloat height);

/*
自动缩放宽度
*/
CGFloat CGWidthAutoMake(CGFloat width);

/*
自动缩放高度
*/
CGFloat CGHeightAutoMake(CGFloat height);

@interface UIView (EDLayout)

@property (assign, nonatomic) CGFloat top;

@property (assign, nonatomic) CGFloat bottom;

@property (assign, nonatomic) CGFloat left;

@property (assign, nonatomic) CGFloat right;

@property (assign, nonatomic) CGPoint origin;

@property (assign, nonatomic) CGFloat centerX;

@property (assign, nonatomic) CGFloat centerY;

@property (assign, nonatomic) CGFloat width;

@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGSize size;

@end

NS_ASSUME_NONNULL_END
