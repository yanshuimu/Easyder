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
        
        [self edSetupSubviews];
    }
    return self;
}

+ (instancetype)createViewFromNib {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    id view = [nibView objectAtIndex:0];
    
    [view edInitialize];
    
    [view edSetupSubviews];
    
    return view;
}

- (void)edInitialize {
    //子类重写
}

- (void)edSetupSubviews {
    //子类重写
}

@end

