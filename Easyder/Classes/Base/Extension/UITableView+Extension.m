//
//  UITableView+Extension.m
//  Yisica
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (void)registerCellClass:(Class)class {
    
    [self registerClass:class forCellReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerCellNib:(Class)class {
    
    NSString *className = NSStringFromClass(class);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:className];
}

- (UIView*)createHeaderViewWithHeight:(CGFloat)height
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, height)];
    self.tableHeaderView = view;
    return view;
}

- (UIView*)createFooterViewWithHeight:(CGFloat)height
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, height)];
    self.tableFooterView = view;
    return view;
}
@end
