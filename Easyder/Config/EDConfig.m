//
//  EDConfig.m
//  Easyder
//
//  Created by mac on 2021/1/29.
//

#import "EDConfig.h"

@implementation EDConfig

+ (EDNavigationControllerStyle*)navigationControllerStyle {
    
    EDNavigationControllerStyle *style = [[EDNavigationControllerStyle alloc] init];
    
    style.barTintColor = [UIColor whiteColor];
    style.barTitleFont = [UIFont systemFontOfSize:17];
    style.barTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    style.itemTintColor = [UIColor whiteColor];
    style.itemTitleFont = [UIFont systemFontOfSize:17];
    style.itemTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    style.bottomLineColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    style.bottomLineHidden = NO;
    
    style.returnButtonOffsetX = 5;
    
    return style;
}

+ (EDBaseAlertViewStyle*)baseAlertViewStyle {
    
    EDBaseAlertViewStyle *style = [[EDBaseAlertViewStyle alloc] init];
    
    style.backgroundColorAlpha = 0.70;
    style.animated = YES;
    style.clickMaskWithHidden = NO;
    
    return style;
}

+ (EDEmptyViewStyle*)emptyViewStyle {
    
    EDEmptyViewStyle *style = [[EDEmptyViewStyle alloc] init];
    
    style.networkErrorTitle = @"呀，网络出了问题";
    style.networkErrorButtonTitle = @"重新连接网络";
    style.title = @"暂时没有内容";
    style.buttonBackgroundColor = [UIColor whiteColor];
    style.buttonTitleColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    style.titleFont = [UIFont systemFontOfSize:13];
    style.titleColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    style.buttonHeight = 40.0;
    style.buttonCornerRadius = 5.0;
    
    /**
     * 示例
     *
     __weak typeof(style) weakStyle = style;
     style.conditionsBlock = ^(NSInteger emptyPageType) {
         
         switch (emptyPageType) {
             case EaseBlankPageTypeServiceItem: {//收银项目列表
                 weakStyle.buttonTitle = @"添加商品";
             }
                 break;
             case EaseBlankPageTypeProduct: {//收银产品列表
                 weakStyle.buttonTitle = @"添加商品";
             }
                 break;
             case EaseBlankPageTypeProductManager: {//产品管理
                 weakStyle.buttonTitle = @"添加产品";
             }
                 break;
             case EaseBlankPageTypeItemManager: {//项目管理
                 weakStyle.buttonTitle = @"添加项目";
             }
                 break;
             case EaseBlankPageTypeCardManager: {//卡管理
                 weakStyle.buttonTitle = @"添加卡";
             }
                 break;
             default://其它页面（这里没有提到的页面，都属于其它）
             {
                 
             }
                 break;
         }
     };
     */
     
    return style;
}

+ (EDSwitchDomainControllerConfig*)switchDomainControllerConfig {
    
    EDSwitchDomainControllerConfig *config = [[EDSwitchDomainControllerConfig alloc] init];
    
    config.domainArray = @[];
    
    config.domainRemarkArray = @[];
    
    config.autoLoginBlock = ^{
        
    };
    
    config.reLoginBlock = ^{
        
    };
    
    return config;
}

@end
