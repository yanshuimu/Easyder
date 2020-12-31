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

+ (instancetype)createWithText:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor;

- (CGSize)calculateWithTargetSize:(CGSize)targetSize;

@end

NS_ASSUME_NONNULL_END
