//
//  UITableView+Extension.h
//  Yisica
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Extension)

/**
 * 注册class
 */
- (void)registerCellClass:(Class)clazz;

/**
 * 注册nib
 */
- (void)registerCellNib:(Class)clazz;

- (UIView*)createHeaderViewWithHeight:(CGFloat)height;

- (UIView*)createFooterViewWithHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
