//
//  UIScrollView+MJRefresh.h
//  MYYManager
//
//  Created by mac on 2020/10/16.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 刷新

@interface UIScrollView (EDRefresh)

- (void)createRefreshHeaderWithTarget:(id)target action:(SEL)action;

- (void)createRefreshFooterWithTarget:(id)target action:(SEL)action;

- (void)createSimpleRefreshHeaderWithTarget:(id)target action:(SEL)action;

- (void)createSimpleRefreshFooterWithTarget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
