//
//  ViewController.m
//  Easyder
//
//  Created by xuhonggui on 2020/12/31.
//

#import "ViewController.h"
#import "Easyder.h"
#import "TestAlertView.h"
#import "TestNextPageCtrl.h"
#import "TestTableViewCtrl.h"
#import "EDBase+Extension.h"
#import "EDSwitchDomainController.h"

@interface ViewController ()
//
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Demo";
    
    [self setupSubviews];
    
    //[self headerRefreshData];
}

- (void)setupSubviews {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self createRefreshHeaderFooter];
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
    
    //cell.textLabel.text = [NSString stringWithFormat:@"row->%ld", (indexPath.row)];
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            TestNextPageCtrl *ctrl = [[TestNextPageCtrl alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
            break;
        case 1:
        {
            TestAlertView *view = [[TestAlertView alloc] init];
            [view show];
        }
            break;
        case 2:
        {
            TestTableViewCtrl *ctrl = [[TestTableViewCtrl alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
            break;
        case 3:
        {
            EDSwitchDomainController *ctrl = [[EDSwitchDomainController alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark -

- (void)headerRefreshData {
    
    [self loadData];
}

- (void)footerRefreshData {
    
    [self loadData];
}

- (void)loadData {
    
    //NSString *url = @"http://www.meiyeyi.com/meiyi-web/api/login.ed";
    NSString *url = @"http://172.16.0.20:82/meiyi-web/api/saleOrderList4App.ed";
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"empno"] = @"10285";
//    params[@"password"] = @"myy123456";
    params[@"customercode"] = @"775";
    params[@"sid"] = @"2decb9c88261412c9540e24a81c0146d";
    params[@"page"] = @(self.page);
    params[@"rows"] = @"10";
    
    [self requestPaginationWithParams:params url:url reloadSelector:@selector(headerRefreshData) response:^(id  _Nonnull responseObject) {
        
        [self.dataArray addObjectsFromArray:responseObject[@"rows"][@"data"]];
        [self.tableView reloadData];
    }];
}

- (NSArray*)titleArray {
    if (!_titleArray) {
        
        _titleArray = @[@"EDNavigationController", @"EDBaseAlertView", @"EDBaseTableViewController", @"EDSwitchDomainController"];
    }
    return _titleArray;
}

@end
