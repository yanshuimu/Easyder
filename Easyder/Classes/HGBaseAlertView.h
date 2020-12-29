//
//  HGBaseAlertView.h
//  CraneMachine
//
//  Created by mac on 2017/11/9.
//  Copyright © 2017年 itdlc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGBaseAlertView : UIView

- (void)show;

- (void)showInView:(UIView *)view;

- (void)showWithAlpha:(CGFloat)alpha;

- (void)hidden;

- (void)hiddenAfter:(NSInteger)duration;

- (void)hiddenWithRemove;

@end
