//
//  EDBaseTableHeaderFooterView.h
//  Easyder
//
//  Created by xuhonggui on 2020/11/26.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseTableHeaderFooterView : UITableViewHeaderFooterView

+ (instancetype)createHeaderFooterView:(UITableView*)tableView;

- (void)initialize;

- (void)setupSubviews;

@end

NS_ASSUME_NONNULL_END
