//
//  EDBaseAlertView.m
//  CraneMachine
//
//  Created by xuhonggui on 2017/11/9.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import "EDBaseAlertView.h"
#import <objc/runtime.h>
#import "EDBaseMacroDefine.h"
#import "UIView+EDExtension.h"
#import "UIColor+EDExtension.h"

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
@property (nonatomic, assign) CGFloat animationDuration;
//
@property (nonatomic, strong) EDBaseAlertViewStyle *style;
@end

@implementation EDBaseAlertView

- (instancetype)initWithStyle:(EDBaseAlertViewStyle*)style {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)]) {
        
        _style = style;
        
        [self configuration];
        
        [self initialize];
        
        [self setupSubviews];
    }
    return self;
}

- (instancetype)init {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)]) {
        
        _style = [EDConfig baseAlertViewStyle];
        
        [self configuration];
        
        [self initialize];
        
        [self setupSubviews];
    }
    return self;
}

- (void)initialize {
    //子类重写
}

- (void)setupSubviews {
    //子类重写
}

- (void)configuration {
        
    _contentOffsetY = -1;
    _contentVerticalAlignment = EDAlertViewContentVerticalAlignmentCenter;
    _animationDuration = 0.4;
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
        _maskView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:_style.backgroundColorAlpha];
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
        
        if (_style.animated) {
            
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
        
        if (_style.clickMaskWithHidden) {
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
    
    Class class = objc_getClass("MBProgressHUD");
    
    for (UIView *view in self.subviews) {
        if (class && [view isKindOfClass:class]) {
            continue;
        }
        if (view == _container) {
            continue;
        }
        [view removeFromSuperview];
        [_container addSubview:view];
    }
}

@end
