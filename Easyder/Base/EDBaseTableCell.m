//
//  DLCBaseTableCell.m
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 easyder. All rights reserved.
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
        
        [self edInitialize];
        
        [self edSetupSubviews];
    }
    return self;
}

- (void)edInitialize {
    //子类重写
}

- (void)edSetupSubviews {
    //子类重写
}

- (void)edSetDataDict:(NSDictionary*)dict {
    //子类重写
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
