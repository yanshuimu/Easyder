//
//  UITextView+Placeholder.m
//  TT
//
//  Created by xuhonggui on 2018/3/15.
//  Copyright © 2018年 xuhonggui. All rights reserved.
//

#import "UITextView+EDExtension.h"
#import "UIColor+EDExtension.h"

@implementation UITextView (EDUtils)

-(void)setPlaceholder:(NSString *)placeholder placeholdColor:(UIColor *)placeholdColor
{
    UILabel *label = [self viewWithTag:-999];
    if (label) {
        [label removeFromSuperview];
    }
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholder;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    placeHolderLabel.tag = -999;
    [self addSubview:placeHolderLabel];
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation UITextView (EDCreate)

+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font {
    
    UITextView *textView = [[self alloc] initWithFrame:frame];
    textView.font = font;
    textView.textColor = EDFontColorBlack;
    
    return textView;
}

+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder {
    
    UITextView *textView = [[self alloc] initWithFrame:frame];
    textView.font = font;
    textView.textColor = EDFontColorBlack;
    [textView setPlaceholder:placeholder placeholdColor:EDHexColor(@"#CCCCCC")];
    
    return textView;
}

+ (instancetype)textViewWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder placeholderColor:(UIColor*)placeholderColor {
    
    UITextView *textView = [[self alloc] initWithFrame:frame];
    textView.font = font;
    textView.textColor = EDFontColorBlack;
    [textView setPlaceholder:placeholder placeholdColor:placeholderColor];
    
    return textView;
}

@end
