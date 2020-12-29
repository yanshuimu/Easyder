//
//  UITextField+Extension.h
//  Kehouyi
//
//  Created by apple on 2019/8/4.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (EDUtils)

- (void)setPlaceholder:(NSString*)placeholder color:(UIColor*)color;

- (UIView*)createLeftViewWithFrame:(CGRect)frame;

- (UIView*)createRightViewWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
