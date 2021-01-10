//
//  NSAttributedString+Create.m
//  VClub
//
//  Created by mac on 2020/12/1.
//  Copyright © 2020 mac. All rights reserved.
//

#import "NSAttributedString+EDExtension.h"

@implementation NSAttributedString (EDUtils)

+ (instancetype)createWithText:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [mutableAttributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, text.length)];
    
    return mutableAttributedString;
}

- (CGSize)calculateWithSize:(CGSize)size {
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGRect rect = [self boundingRectWithSize:size options:options context:nil];
    
    return rect.size;
}

@end
