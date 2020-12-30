//
//  DLCBaseTableCell.h
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDBaseTableCell : UITableViewCell

+ (instancetype)createTableCell:(UITableView*)tableView;

- (void)initialize;

- (void)setDataDict:(NSDictionary*)dict;

@end
