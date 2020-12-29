//
//  DLCBaseTableCell.m
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDBaseTableCell.h"

@implementation EDBaseTableCell

+ (instancetype)createTableCell:(UITableView*)tableView {
    
    NSString *cellID = NSStringFromClass([self class]);
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    //子类实现
}

- (void)setDataDict:(NSDictionary*)dict {
    //子类实现
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
