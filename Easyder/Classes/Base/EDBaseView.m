//
//  DLCBaseView.m
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDBaseView.h"

@implementation EDBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

+ (instancetype)createViewFromNib {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    id view = [nibView objectAtIndex:0];
    [view initialize];
    return view;
}

- (void)initialize {}

@end

