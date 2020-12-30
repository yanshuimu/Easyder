//
//  EDBaseAlertView.h
//  CraneMachine
//
//  Created by mac on 2017/11/9.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EDAlertViewContentVerticalAlignment) {
    
    EDAlertViewContentVerticalAlignmentTop,
    EDAlertViewContentVerticalAlignmentCenter,
    EDAlertViewContentVerticalAlignmentBottom
};

@interface EDBaseAlertView : UIView

//是否执行动画，默认NO
@property (nonatomic, assign) BOOL animated;
//点击蒙版是否隐藏，默认NO
@property (nonatomic, assign) BOOL clickMaskOnTheHidden;
//内容垂直对齐方式
@property (nonatomic, assign) EDAlertViewContentVerticalAlignment contentVerticalAlignment;
/**
 * 子类重写
 */
- (void)initialize;

/**
 * 子类重写
 */
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
