//
//  EDEmptyViewStyle.m
//  Easyder
//
//  Created by xuhonggui on 2021/1/27.
//

#import "EDEmptyViewStyle.h"

@implementation EDEmptyViewStyle

- (instancetype)init
{
    if (self = [super init]) {
        
        _networkErrorTitle = @"呀，网络出了问题";
        _networkErrorButtonTitle = @"重新连接网络";
        _title = @"暂时没有内容";
        _buttonBackgroundColor = [UIColor whiteColor];
        _buttonTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        _titleFont = [UIFont systemFontOfSize:13];
        _titleColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
        _buttonHeight = 40.0;
        _buttonCornerRadius = 5.0;
        _buttonBorderWidth = 0.5;
        _buttonBorderColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
        _buttonTitleFont = [UIFont systemFontOfSize:14];
        
        //在block中根据emptyPageType枚举值处理不同情况界面展示
         _conditionsBlock = ^(NSInteger emptyPageType) {
             
             switch (emptyPageType) {
                 default://其它页面（这里没有提到的页面，都属于其它）
                 {
                     
                 }
                     break;
             }
         };
    }
    return self;
}

@end
