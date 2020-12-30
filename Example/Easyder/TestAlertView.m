//
//  TestAlertView.m
//  Easyder_Example
//
//  Created by mac on 2020/12/30.
//  Copyright © 2020 yanshuimu. All rights reserved.
//

#import "TestAlertView.h"

@implementation TestAlertView

- (void)setupSubviews {
    
    EDRectDefine
    
    x = CGWidthAutoMake(20);
    width = SCREEN_W - x * 2;
    height = CGWidthAutoMake(89);
    y = SCREEN_H/2 - height/2;
    UIView *backView = [UIView viewWithFrame:CGRectMake(x, y, width, height) backgroundColor:EDWhiteColor cornerRadius:4];
    [self addSubview:backView];
    
    height = CGWidthAutoMake(49);
    width = backView.width - x * 2;
    y = backView.height - height - x;
    UIButton *sureBtn = [UIButton buttonWithFrame:CGRectMake(x, y, width, height) title:@"确定" titleColor:EDWhiteColor font:EDAutoFont(16) backgroundColor:EDThemeColor cornerRadius:4];
    [backView addSubview:sureBtn];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    width = height = CGWidthAutoMake(44);
    x = backView.right - width;
    y = backView.top - height;
    UIButton *closeBtn = [UIButton buttonWithFrame:CGRectMake(x, y, width, height) imageName:@"btn_contactus_cancel"];
    [closeBtn addTarget:self action:@selector(hiddenWithRemove) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
}

- (void)sureBtnClick {
    NSLog(@"sureBtnClick");
}

@end
