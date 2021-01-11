//
//  NSAttributedString+Create.h
//  VClub
//
//  Created by mac on 2020/12/1.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (EDUtils)

/**
 * 根据text、font、textColor生成NSAttributedString
 */
+ (instancetype)createWithText:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor;

/**
 * 根据字符串数组与对应颜色数组生成NSAttributedString
 */
+ (instancetype)createWithStringArray:(NSArray*)stringArray colorArray:(NSArray*)colorArray;

/**
 * 根据字符串数组与对应字体数组生成NSAttributedString
 */
+ (instancetype)createWithStringArray:(NSArray*)stringArray fontArray:(NSArray*)fontArray;

/**
 * 根据行间距生成NSAttributedString
 */
+ (instancetype)createWithString:(NSString*)string lineSpacing:(NSInteger)lineSpacing;

/**
 * 计算NSAttributedString的大小
 */
- (CGSize)calculateWithSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
