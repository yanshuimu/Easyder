//
//  EDBaseAlertView.m
//  CraneMachine
//
//  Created by mac on 2017/11/9.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDBaseAlertView.h"
#import <objc/runtime.h>
#import <EDBaseMacroDefine.h>
#import <UIView+EDExtension.h>

@interface EDBaseAlertView ()
//
@property (nonatomic, strong) UIWindow *alertWindow;
//
@property (nonatomic, strong) UIView *maskView;
//
@property (nonatomic, strong) UIButton *hiddenBtn;
//
@property (nonatomic, strong) UIView *backView;
//容器
@property (nonatomic, strong) UIView *container;
//内容位置
@property (nonatomic, assign) CGFloat contentOffsetY;
//
@property (nonatomic, assign) CGFloat backgroundColorAlpha;
//
@property (nonatomic, assign) CGFloat animationDuration;
@end

@implementation EDBaseAlertView

- (instancetype)init {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)]) {
        [self edInitialize];
    }
    return self;
}

- (void)edInitialize {
        
    [self configuration];

    [self edSetupSubviews];
}

- (void)edSetupSubviews {
    //子类重写
}

- (void)configuration {
    
    EDConfiguration *configuration = EDManagerSingleton.alertViewConfiguration;
    
    _contentOffsetY = -1;
    _contentVerticalAlignment = EDAlertViewContentVerticalAlignmentCenter;
    _animationDuration = 0.4;
    _backgroundColorAlpha = configuration.backgroundColorAlpha > 0 ? configuration.backgroundColorAlpha : EDDefaultBackgroundAlpha;
    _animated = configuration.alertViewAnimated;
    _clickMaskOnTheHidden = configuration.alertViewClickMaskOnTheHidden;
}

- (void)show
{
    if (self.hidden)
    {
        _maskView.hidden = NO;
        self.hidden = NO;
    }
    else
    {
        UIView *superView = [UIApplication sharedApplication].delegate.window.rootViewController.view;
        
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = EDColorA(0, 0, 0, _backgroundColorAlpha);
        [superView addSubview:_maskView];
        [superView addSubview:self];
        
        _container = [[UIView alloc] initWithFrame:self.bounds];
        _container.alpha = 0.0;
        [self insertSubview:_container atIndex:0];
        
        _hiddenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _hiddenBtn.frame = _container.bounds;
        [_container insertSubview:_hiddenBtn atIndex:0];
        
        [self transferSubviewsToContainer];
        
        [self resetContainerFrame];
        
        [self calcContentOffsetY];
        
        if (_animated) {
            
            EDWeakSelf
            [UIView animateWithDuration:_animationDuration animations:^{
                
                weakSelf.container.top = self.contentOffsetY;
                weakSelf.container.alpha = 1.0;
            }];
        }
        else {
            
            _container.top = self.contentOffsetY;
            _container.alpha = 1.0;
        }
        
        if (_clickMaskOnTheHidden) {
            [_hiddenBtn addTarget:self action:@selector(hiddenBtnClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)hidden
{
    _maskView.hidden = YES;
    self.hidden = YES;
}

- (void)hiddenWithRemove
{
    [_maskView removeFromSuperview];
    [self removeFromSuperview];
}

- (void)hiddenAfterDelay:(NSInteger)seconds
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hidden];
    });
}

- (void)hiddenWithRemoveAfterDelay:(NSInteger)seconds
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenWithRemove];
    });
}

- (void)hiddenBtnClick {
    [self hiddenWithRemove];
}

- (void)calcContentOffsetY
{
    if (_contentOffsetY != -1) {
        return;
    }
    
    switch (_contentVerticalAlignment) {
        case EDAlertViewContentVerticalAlignmentTop:
        {
            _contentOffsetY =  0.0;
        }
            break;
        case EDAlertViewContentVerticalAlignmentCenter:
        {
            _contentOffsetY = SCREEN_H/2 - _container.height/2;
        }
            break;
        case EDAlertViewContentVerticalAlignmentBottom:
        {
            _contentOffsetY = SCREEN_H - _container.height - EDViewBottom_H;
        }
            break;
        default:
            break;
    }
}

- (void)resetContainerFrame
{
    CGRect frame = _container.frame;
    frame.origin.y = SCREEN_H;
    _container.frame = frame;
}

- (void)transferSubviewsToContainer {
    
    for (UIView *view in self.subviews) {
        if (view != _container) {
            [view removeFromSuperview];
            [_container addSubview:view];
        }
    }
}

@end
