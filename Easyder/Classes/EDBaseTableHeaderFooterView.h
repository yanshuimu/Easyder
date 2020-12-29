//
//  EDBaseTableHeaderFooterView.h
//  VClub
//
//  Created by mac on 2020/11/26.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseTableHeaderFooterView : UITableViewHeaderFooterView

+ (instancetype)createHeaderFooterView:(UITableView*)tableView;

- (void)initialize;

@end

NS_ASSUME_NONNULL_END
