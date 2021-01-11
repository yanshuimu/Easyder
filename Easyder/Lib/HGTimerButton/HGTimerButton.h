/*
 The MIT License (MIT)
 
 Copyright (c) 2017, xuhonggui.
 All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface HGTimerButton : UIButton

/**
* 倒计时结束回调
*/
@property (nonatomic, copy) void (^didCountDownCompleteBlock)(void);

/**
 * 初始时间,默认60s
 */
@property (nonatomic, assign) NSInteger startCount;

/**
 * 禁用格式,&符号为占位符,如:重新获取(&s)
 */
@property (nonatomic, copy) NSString *disabledTitleFormat;

/**
 * 开始倒计时
 */
- (void)start;

@end
