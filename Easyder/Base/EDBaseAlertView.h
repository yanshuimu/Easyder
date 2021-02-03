//
//  EDBaseAlertView.h
//  CraneMachine
//
//  Created by xuhonggui on 2017/11/9.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDConfig.h"

typedef NS_ENUM(NSInteger, EDAlertViewContentVerticalAlignment) {
    
    EDAlertViewContentVerticalAlignmentTop,
    EDAlertViewContentVerticalAlignmentCenter,
    EDAlertViewContentVerticalAlignmentBottom
};

@interface EDBaseAlertView : UIView

//内容垂直对齐方式
@property (nonatomic, assign) EDAlertViewContentVerticalAlignment contentVerticalAlignment;
//
@property (nonatomic, strong) EDBaseAlertViewStyle *style;

- (instancetype)initWithStyle:(EDBaseAlertViewStyle*)style;

- (void)initialize;

- (void)setupSubviews;

/**
 * 显示
 */
- (void)show;

/**
 * 隐藏
 */
- (void)hidden;

/**
 * 延迟隐藏
 */
- (void)hiddenAfterDelay:(NSInteger)seconds;

/**
 * 隐藏并移除
 */
- (void)hiddenWithRemove;

/**
 * 延迟隐藏并移除
 */
- (void)hiddenWithRemoveAfterDelay:(NSInteger)seconds;

@end
