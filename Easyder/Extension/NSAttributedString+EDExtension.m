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

+ (instancetype)createWithStringArray:(NSArray*)stringArray colorArray:(NSArray*)colorArray {
    
    NSString *string = [self arrayToString:stringArray dotString:@""];
    NSMutableAttributedString *testStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger strLength = 0;
    for (int i = 0 ; i < stringArray.count; i++) {
        [testStr addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:NSMakeRange(strLength,[stringArray[i] length])];
        strLength = [stringArray[i] length] + strLength;
    }
    return testStr;
}

+ (instancetype)createWithStringArray:(NSArray*)stringArray fontArray:(NSArray*)fontArray {
    
    NSString *string = @"";
    for (int i = 0; i < stringArray.count; i++) {
        string = [string stringByAppendingString:stringArray[i]];
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger textIndex = 0;
    for (int i = 0; i < stringArray.count; i++) {
        [attributedString addAttribute:NSFontAttributeName value:fontArray[i] range:NSMakeRange(textIndex, [stringArray[i] length])];
        textIndex = textIndex + [stringArray[i] length];
    }
    return attributedString;
}

+ (instancetype)createWithString:(NSString*)string lineSpacing:(NSInteger)lineSpacing {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return attributedString;
}

+ (NSString *)arrayToString:(NSArray *)arr dotString:(NSString *)dot{
    NSString *string = [arr componentsJoinedByString:dot];
    return string;
}

@end
