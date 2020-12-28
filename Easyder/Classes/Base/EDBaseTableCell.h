//
//  DLCBaseTableCell.h
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDBaseTableCell : UITableViewCell

+ (instancetype)createCell:(UITableView*)tableView;

//在complete块中执行其他初始化操作
+ (instancetype)createDefaultCell:(UITableView*)tableView complete:(void(^)(id defultCell))complete;

- (void)initialize;

- (void)setDataDict:(NSDictionary*)dict;

@end
