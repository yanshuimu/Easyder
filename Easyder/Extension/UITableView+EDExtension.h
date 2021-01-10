//
//  UITableView+Extension.h
//  Yisica
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (EDUtils)

/**
 * 注册UITableViewCell
 */
- (void)registerForCellWithClass:(Class)clazz;

/**
 * 注册UITableViewCell(xib)
 */
- (void)registerForNibWithClass:(Class)clazz;

/*
 * 注册UITableViewHeaderFooterView
 */
- (void)registerForHeaderFooterClass:(Class)clazz;

@end

NS_ASSUME_NONNULL_END
