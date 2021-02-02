//
//  DLCBaseTableCell.h
//  DigitalBookHouse
//
//  Created by xuhonggui on 2017/6/14.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDBaseTableCell : UITableViewCell

+ (instancetype)createTableCell:(UITableView*)tableView;

- (void)initialize;

- (void)setupSubviews;

- (void)setDataDict:(NSDictionary*)dict;

@end
