//
//  DLCBaseTableViewController.h
//  NewtonFitness
//
//  Created by mac on 2017/7/10.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDBaseViewController.h"

@interface EDBaseTableViewController : EDBaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSInteger _page;
}
@property (nonatomic,strong) UITableView     *tableView;
@property (nonatomic,strong) NSMutableArray  *dataArray;
//
@property (nonatomic, assign) NSInteger page;

/*
 * 更换TableViewStyle 想用 UITableViewStylePlain 在继承视图中重写此方法
 */
- (UITableViewStyle)tableViewStyle;

/*
 * 同时创建上拉、下拉刷新视图
 */
- (void)createRefreshHeaderFooter;

/*
 * 创建下拉刷新视图
 */
- (void)createRefreshHeader;

/*
 * 创建上拉刷新视图
 */
- (void)createRefreshFooter;

/*
 * 刷新下拉 方法 默认为refreshData
 */
- (void)headerRefreshData;

/*
 * 刷新上拉 方法 默认为refreshData
 */
- (void)footerRefreshData;

@end
