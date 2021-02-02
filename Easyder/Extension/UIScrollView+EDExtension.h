//
//  UIScrollView+MJRefresh.h
//  Easyder
//
//  Created by xuhonggui on 2020/10/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (EDRefresh)

/**
 * 创建下拉刷新控件
 */
- (void)createRefreshHeaderWithTarget:(id)target action:(SEL)action;

/**
 * 创建上拉加载更多控件
 */
- (void)createRefreshFooterWithTarget:(id)target action:(SEL)action;

/**
 * 创建不带提示语下拉刷新控件
 */
- (void)createSimpleRefreshHeaderWithTarget:(id)target action:(SEL)action;

/**
 * 创建不带提示语上拉加载更多控件
 */
- (void)createSimpleRefreshFooterWithTarget:(id)target action:(SEL)action;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

//解决Controller中有UIScrollView导致侧滑返回失效的问题
@interface UIScrollView (EDPanBack)

@end

NS_ASSUME_NONNULL_END
