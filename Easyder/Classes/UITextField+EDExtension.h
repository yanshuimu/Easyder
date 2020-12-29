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



















































@interface UITextField (EDCreate)

/**
 * font
 */
+ (instancetype)textFieldWithFont:(UIFont*)font;

/**
 * font、placeholder
 */
+ (instancetype)textFieldWithFont:(UIFont*)font placeholder:(NSString*)placeholder;

+ (instancetype)textFieldWithFrame:(CGRect)frame font:(UIFont*)font;

/**
 * frame、font、placeholder
 */
+ (instancetype)textFieldWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder;

@end

NS_ASSUME_NONNULL_END
