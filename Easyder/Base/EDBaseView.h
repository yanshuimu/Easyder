//
//  DLCBaseView.h
//  DigitalBookHouse
//
//  Created by xuhonggui on 2017/6/14.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDBaseView : UIView

/**
 * 由xib创建view
 */
+ (instancetype)createViewFromNib;

- (void)initialize;

- (void)setupSubviews;

@end
