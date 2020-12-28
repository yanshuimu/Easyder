//
//  UIView+LYEmptyView.h
//  MYYProject
//
//  Created by mac on 2019/3/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Empty.h"
#import "LYEmptyView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, EaseBlankPageType)
{
    EaseBlankPageTypeView = 0,
    EaseBlankPageTypeConsume,
    EaseBlankPageTypeSearch,
    EaseBlankPageTypeShoppingCart,
    EaseBlankPageTypeShoppingCartMemberSearch
};

@interface UIView (LYEmptyView)

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(LYActionTapBlock)block;

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError offsetY:(CGFloat)offsetY reloadButtonBlock:(LYActionTapBlock)block;

@end

NS_ASSUME_NONNULL_END
