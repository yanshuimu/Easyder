//
//  DLCBaseTableViewController.h
//  NewtonFitness
//
//  Created by mac on 2017/7/10.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDBaseViewController.h"
#import "EDProtocol.h"

@interface EDBaseTableViewController : EDBaseViewController<UITableViewDataSource, UITableViewDelegate, EDPaginationDelegate>

@property (nonatomic,strong) UITableView     *tableView;
@property (nonatomic,strong) NSMutableArray  *dataArray;
//
@property (nonatomic, assign) __block NSInteger page;
//
@property (nonatomic, weak) id<EDPaginationDelegate> paginationDelegate;
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
 * 下拉刷新方法
 */
- (void)headerRefreshData;

/*
 * 上拉加载更多方法
 */
- (void)footerRefreshData;

@end
