//
//  DLCBaseView.m
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDBaseView.h"

@implementation EDBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self edInitialize];
    }
    return self;
}

+ (instancetype)createViewFromNib {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    id view = [nibView objectAtIndex:0];
    [view edInitialize];
    return view;
}

- (void)edInitialize {
    
    [self edSetupSubviews];
}

- (void)edSetupSubviews {
    //子类实现
}

@end

