//
//  UITableView+Extension.m
//  Yisica
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UITableView+EDExtension.h"

@implementation UITableView (EDExtension)

- (void)registerForCellWithClass:(Class)clazz {
    
    [self registerClass:clazz forCellReuseIdentifier:NSStringFromClass(clazz)];
}

- (void)registerForNibWithClass:(Class)clazz {
    
    NSString *className = NSStringFromClass(clazz);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:className];
}

- (void)registerForHeaderFooterClass:(Class)clazz {
    
    [self registerClass:clazz forHeaderFooterViewReuseIdentifier:NSStringFromClass(clazz)];
}

@end
