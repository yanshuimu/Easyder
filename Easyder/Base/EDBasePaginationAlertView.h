//
//  EDBasePaginationAlertView.h
//  Easyder
//
//  Created by mac on 2021/1/14.
//

#import "EDBaseAlertView.h"
#import "EDProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface EDBasePaginationAlertView : EDBaseAlertView <UITableViewDataSource, UITableViewDelegate, EDPaginationDelegate>

@property (nonatomic,strong) UITableView *tableView;
//
@property (nonatomic,strong) NSMutableArray *dataArray;
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

NS_ASSUME_NONNULL_END
