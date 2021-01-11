//
//  DLCBaseView.h
//  DigitalBookHouse
//
//  Created by mac on 2017/6/14.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDBaseView : UIView

/**
 * 由xib创建view
 */
+ (instancetype)createViewFromNib;

- (void)edInitialize;

- (void)edSetupSubviews;

@end
