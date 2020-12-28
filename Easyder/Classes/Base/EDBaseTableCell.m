//
//  DLCBaseTableCell.m
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDBaseTableCell.h"

@implementation EDBaseTableCell

+ (instancetype)createCell:(UITableView*)tableView {
    
    NSString *cellID = NSStringFromClass([self class]);
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
}

+ (instancetype)createDefaultCell:(UITableView*)tableView complete:(void(^)(id defultCell))complete {
    
    NSString *cellID = NSStringFromClass([self class]);
    EDBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EDBaseTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        complete(cell);
    } 
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
    
    
}

- (void)setDataDict:(NSDictionary*)dict {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
