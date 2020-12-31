//
//  UITextView+Placeholder.m
//  TT
//
//  Created by mac on 2018/3/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UITextView+EDExtension.h"
#import <EDBaseMacroDefine.h>

@implementation UITextView (EDUtils)

-(void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholdStr;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    
    /*
     [self setValue:(nullable id) forKey:(nonnull NSString *)]
     ps: KVC键值编码，对UITextView的私有属性进行修改
     */
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}

@end



















































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
