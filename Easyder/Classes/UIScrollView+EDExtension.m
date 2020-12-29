//
//  UIScrollView+MJRefresh.m
//  MYYManager
//
//  Created by mac on 2020/10/16.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UIScrollView+EDExtension.h"
#import <MJRefresh/MJRefresh.h>

@implementation UIScrollView (EDRefresh)

- (void)createRefreshHeaderWithTarget:(id)target action:(SEL)action {
    
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
}

- (void)createRefreshFooterWithTarget:(id)target action:(SEL)action {
    
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    self.mj_footer.hidden = YES;
}

- (void)createSimpleRefreshHeaderWithTarget:(id)target action:(SEL)action {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    header.stateLabel.hidden = YES;
    
    self.mj_header = header;
}

- (void)createSimpleRefreshFooterWithTarget:(id)target action:(SEL)action {
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    footer.stateLabel.hidden = YES;
    
    self.mj_footer = footer;
    self.mj_footer.hidden = YES;
}

@end
