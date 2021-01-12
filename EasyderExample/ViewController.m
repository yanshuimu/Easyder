//
//  ViewController.m
//  Easyder
//
//  Created by mac on 2020/12/31.
//

#import "ViewController.h"
#import "Easyder.h"
#import "TestAlertView.h"
#import "TestNextPageCtrl.h"
#import "TestTableViewCtrl.h"

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
    
    [self headerRefreshData];
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
        default:
            break;
    }
}

#pragma mark -

- (void)headerRefreshData {
    
    [self.view showLoading];
    NSString *url = @"http://www.meiyeyi.com/meiyi-web/api/login.ed";
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"empno"] = @"10285";
    params[@"password"] = @"myy123456";
    
    [EDNetApiManager requestPostWithParamDict:params Url:url withHandle:^(BOOL netSuccess, BOOL dataSuccess, NSString *msg, id responseObject) {
            
        if (netSuccess && dataSuccess) {
            [self.view hideLoading];
        }
        else {
            [self.view showLoadingMeg:msg];
        }
        [self.tableView configBlankPage:0 hasData:YES hasMoreData:YES hasError:!netSuccess reloadButtonBlock:^{
                    
        }];
    }];
}

- (NSArray*)titleArray {
    if (!_titleArray) {
        
        _titleArray = @[@"EDNavigationController", @"EDBaseAlertView", @"EDBaseTableViewController"];
    }
    return _titleArray;
}

@end
