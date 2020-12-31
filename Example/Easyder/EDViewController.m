//
//  EDViewController.m
//  Easyder
//
//  Created by yanshuimu on 12/25/2020.
//  Copyright (c) 2020 yanshuimu. All rights reserved.
//

#import "EDViewController.h"
#import <Easyder.h>
#import "TestAlertView.h"
#import "NextPageCtrl.h"

@interface EDViewController ()
//
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation EDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Demo";
    
    [self setupSubviews];
}

- (void)setupSubviews {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CGWidthAutoMake(44.0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"tableViewCellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            NextPageCtrl *ctrl = [[NextPageCtrl alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
            break;
        case 1:
        {
            TestAlertView *view = [[TestAlertView alloc] init];
            [view show];
        }
            break;
            
        default:
            break;
    }
}

- (NSArray*)titleArray {
    if (!_titleArray) {
        
        _titleArray = @[@"EDNavigationController", @"EDBaseAlertView"];
    }
    return _titleArray;
}

@end
