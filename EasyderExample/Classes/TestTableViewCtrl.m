//
//  TestTableViewCtrl.m
//  Easyder_Example
//
//  Created by xuhonggui on 2020/12/31.
//  Copyright © 2020 yanshuimu. All rights reserved.
//

#import "TestTableViewCtrl.h"

@interface TestTableViewCtrl ()

@end

@implementation TestTableViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"TestTableViewCtrl";
    
    [self setupSubviews];
}

- (void)setupSubviews {
 
    [self.tableView configEmptyPage:2 hasData:NO hasError:NO reloadButtonBlock:^{
        
    }];
}
@end
