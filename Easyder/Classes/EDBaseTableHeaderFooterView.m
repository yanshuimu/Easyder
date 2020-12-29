//
//  EDBaseTableHeaderFooterView.m
//  VClub
//
//  Created by mac on 2020/11/26.
//  Copyright © 2020 mac. All rights reserved.
//

#import "EDBaseTableHeaderFooterView.h"

@implementation EDBaseTableHeaderFooterView

+ (instancetype)createHeaderFooterView:(UITableView*)tableView {
    
    NSString *cellID = NSStringFromClass(self.class);
    id view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    if (!view) {
        view = [[self alloc] initWithReuseIdentifier:cellID];
    }
    return view;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
}

@end
