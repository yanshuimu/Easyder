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
 * 计算NSAttributedString的大小
 */
- (CGSize)calculateWithSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
