//
//  UIView+EDExtension.h
//  EasyderDemo
//
//  Created by mac on 2020/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Loading

@interface UIView (Loading)



@end

@interface UIView (EDExtension)

/**
 * 添加线条
 */
- (UIView*)addLineWithFrame:(CGRect)frame backgroundColor:(UIColor*)color;

/**
 * 移除所有子视图
 */
- (void)removeChildViews;

@end

NS_ASSUME_NONNULL_END
