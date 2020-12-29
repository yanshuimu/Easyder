//
//  DLCBaseTableViewController.m
//  NewtonFitness
//
//  Created by mac on 2017/7/10.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDBaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "EDBaseMacroDefine.h"

@interface EDBaseTableViewController ()

@end

@implementation EDBaseTableViewController

@synthesize dataArray = _dataArray;
@synthesize tableView = _tableView;
@synthesize page = _page;

// 更换TableViewStyle 想用 UITableViewStylePlain 在继承视图中重写此方法
-(UITableViewStyle)tableViewStyle
{
    return UITableViewStyleGrouped;
}

//默认风格
- (UITableView *)tableView
{
    if (!_tableView) {
        CGFloat defa_x = 0.0f , defa_y = 0 , defa_w = SCREEN_W , defa_h = SCREEN_H - EDNavBar_H - EDViewBottom_H;
        CGRect rect = CGRectMake(defa_x, defa_y, defa_w, defa_h);
        _tableView = [[UITableView alloc] initWithFrame:rect style:[self tableViewStyle]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.showsHorizontalScrollIndicator = NO;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray array];
    _page = 1;
    
    [self.view addSubview:self.tableView];
    [self.view sendSubviewToBack:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    AdjustsScrollViewInsetNever(self, self.tableView);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.contentInset = UIEdgeInsetsZero;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

#pragma mark - Setter & Getter


#pragma mark - UITableViewDelegate & DataSource Method

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *baseCellIdentifier = @"baseCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:baseCellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseCellIdentifier];
    }
    return cell;
}

#pragma mark - Custom Method

- (void)createRefreshHeaderFooter {
    
    [self createRefreshHeader];
    [self createRefreshFooter];
}

//创建下拉刷新试图
- (void)createRefreshHeader
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
    refreshingAction:@selector(headerRefreshData)];
}

//创建上拉加载试图
- (void)createRefreshFooter
{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self
    refreshingAction:@selector(footerRefreshData)];
    self.tableView.mj_footer.hidden = YES;
}

#pragma - RefreshData

- (void)headerRefreshData
{
    
}

- (void)footerRefreshData
{
    
}

@end
