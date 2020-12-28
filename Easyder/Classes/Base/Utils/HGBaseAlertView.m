//
//  HGBaseAlertView.m
//  CraneMachine
//
//  Created by mac on 2017/11/9.
//  Copyright © 2017年 itdlc. All rights reserved.
//

#import "HGBaseAlertView.h"

@interface HGBaseAlertView ()
{
    UIWindow *_alertWindow;
    UIButton *_hiddenButton;
}
@end

@implementation HGBaseAlertView

- (void)show
{
    //隐藏状态
    if (self.hidden)
    {
        _hiddenButton.hidden = NO;
        self.hidden = NO;
    }
    else
    {
        UIView *superView = [UIApplication sharedApplication].delegate.window.rootViewController.view;
        
        _hiddenButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _hiddenButton.alpha = 1.0;
        _hiddenButton.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
        _hiddenButton.backgroundColor = [self colorWithHexString:@"000000" alpha:kDefaultBackgroundAlpha];
        //[_hiddenButton addTarget:self action:@selector(hiddenBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _hiddenButton.userInteractionEnabled = YES;
        [superView addSubview:_hiddenButton];
        
        [superView addSubview:self];
        
        [UIView animateWithDuration:0.0 animations:^{
            //_hiddenButton.backgroundColor = [self colorWithHexString:@"000000" alpha:kDefaultBackgroundAlpha];
        }];
    }
}

- (void)showWithAlpha:(CGFloat)alpha
{
    UIView *superView = [UIApplication sharedApplication].delegate.window.rootViewController.view;
    
    _hiddenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _hiddenButton.alpha = 0;
    _hiddenButton.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
    _hiddenButton.backgroundColor = [self colorWithHexString:@"000000" alpha:alpha];
    [superView addSubview:_hiddenButton];
    
    [superView addSubview:self];
    
    [UIView animateWithDuration:0.0 animations:^{
        _hiddenButton.backgroundColor = [self colorWithHexString:@"000000" alpha:kDefaultBackgroundAlpha];
    }];
}

- (void)showInView:(UIView *)view {
    
    _hiddenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _hiddenButton.alpha = 0;
    _hiddenButton.frame = view.bounds;
    _hiddenButton.backgroundColor = [self colorWithHexString:@"000000" alpha:kDefaultBackgroundAlpha];
    [view addSubview:_hiddenButton];
    
    self.frame = view.bounds;
    [view addSubview:self];
    
    [UIView animateWithDuration:0.0 animations:^{
        
        _hiddenButton.alpha = 1;
    }];
}

- (void)hidden
{
    _hiddenButton.hidden = YES;
    self.hidden = YES;
}

- (void)hiddenWithRemove
{
    [_hiddenButton removeFromSuperview];
    [self removeFromSuperview];
}

- (void)hiddenAfter:(NSInteger)duration
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hidden];
    });
}

- (UIColor *) colorWithHexString: (NSString *) stringToConvert alpha:(CGFloat)alpha{
    
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

- (void)hiddenBtnClick {
    
}

@end
