//
//  EDViewController.m
//  Easyder
//
//  Created by yanshuimu on 12/25/2020.
//  Copyright (c) 2020 yanshuimu. All rights reserved.
//

#import "EDViewController.h"
#import <Easyder.h>

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
    }
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    return cell;
}

- (NSArray*)titleArray {
    if (!_titleArray) {
        
        _titleArray = @[@"EDBaseAlertView"];
    }
    return _titleArray;
}

@end
