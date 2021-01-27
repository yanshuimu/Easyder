//
//  EDEmptyViewStyle.m
//  Easyder
//
//  Created by mac on 2021/1/27.
//

#import "EDEmptyViewStyle.h"

@implementation EDEmptyViewStyle

- (instancetype)init {
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
        
        /*
         * 自定义判断示例
        __weak typeof(self) weakSelf = self;
        _conditionsBlock = ^(NSInteger emptyPageType) {
            
            switch (emptyPageType) {
                case 0:
                {
                    [weakSelf setTitle:@"标题0"];
                }
                    break;
                case 1:
                {
                    [weakSelf setTitle:@"标题1"];
                    [weakSelf setImageName:@"图片1"];
                }
                    break;
                case 2:
                {
                    [weakSelf setTitle:@"标题2"];
                    [weakSelf setImageName:@"图片2"];
                    [weakSelf setButtonTitle:@"按钮标题2"];
                    
                    //设置其他属性
                }
                    break;
                    
                default:
                    break;
            }
        };
        */
    }
    return self;
}

@end
