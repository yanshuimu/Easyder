//
//  DLCBaseView.m
//  DigitalBookHouse
//
//  Created by xuhonggui on 2017/6/14.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import "EDBaseView.h"

@implementation EDBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
        
        [self setupSubviews];
    }
    return self;
}

+ (instancetype)createViewFromNib {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    id view = [nibView objectAtIndex:0];
    
    [view initialize];
    
    [view setupSubviews];
    
    return view;
}

- (void)initialize {
    //子类重写
}

- (void)setupSubviews {
    //子类重写
}

@end

