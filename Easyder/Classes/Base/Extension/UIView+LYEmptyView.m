//
//  UIView+LYEmptyView.m
//  MYYProject
//
//  Created by mac on 2019/3/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UIView+LYEmptyView.h"

@implementation UIView (LYEmptyView)

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(LYActionTapBlock)block{
    [self configBlankPage:blankPageType hasData:hasData hasError:hasError offsetY:0 reloadButtonBlock:block];
}

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError offsetY:(CGFloat)offsetY reloadButtonBlock:(LYActionTapBlock)block{
    if (hasData) {
        if (self.ly_emptyView) {
            [self ly_hideEmptyView];
            [self.ly_emptyView removeFromSuperview];
        }
    }else{
        
        if (hasData) {
            [self ly_hideEmptyView];
            [self.ly_emptyView removeFromSuperview];
            return;
        }
        self.alpha = 1.0;
        NSString *imageName, *titleStr, *tipStr;
        NSString *buttonTitle;
        if (hasError) {
            //        加载失败
            tipStr = @"呀，网络出了问题";
            imageName = @"empty_jd";
            buttonTitle = @"重新连接网络";
        }else{
            //        空白数据
            switch (blankPageType) {
                case EaseBlankPageTypeConsume: {//消费明细
                    tipStr = @"没有消费记录";
                }
                    break;
                case EaseBlankPageTypeSearch: {//搜索
                    tipStr = @"没有搜索结果";
                }
                    break;
                case EaseBlankPageTypeShoppingCart: {//购物车
                    tipStr = @"购物车为空";
                    imageName = @"transaction6";
                }
                    break;
                case EaseBlankPageTypeShoppingCartMemberSearch: {//购物车搜索
                    tipStr = @"没有搜索结果";
                    imageName = @"transaction4_small";
                }
                    break;
                default://其它页面（这里没有提到的页面，都属于其它）
                {
                    tipStr = @"没有此记录";
                }
                    break;
            }
        }
        imageName = imageName ?: @"quesheng";
        
        
        
        LYEmptyView *emptyV = [LYEmptyView emptyActionViewWithImageStr:imageName titleStr:tipStr detailStr:nil btnTitleStr:buttonTitle btnClickBlock:block];
        emptyV.autoShowEmptyView = NO;
        emptyV.actionBtnBackGroundColor = [UIColor redColor];
        emptyV.actionBtnTitleColor = [UIColor whiteColor];
//        emptyV.titleLabFont = ;
        emptyV.titleLabTextColor = EDColor(@"#B1B1B1");
        self.ly_emptyView = emptyV;
        
        //    布局
        if (ABS(offsetY) > 0) {
            self.ly_emptyView.contentViewOffset = offsetY;
        }
        
        [self ly_showEmptyView];
    }
}

@end
