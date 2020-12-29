//
//  UITextField+Extension.m
//  Kehouyi
//
//  Created by apple on 2019/8/4.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UITextField+EDExtension.h"
#import <EDBaseMacroDefine.h>

@implementation UITextField (EDUtils)

- (void)setPlaceholder:(NSString*)placeholder color:(UIColor*)color
{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{
        NSForegroundColorAttributeName: color
    }];
}

- (UIView*)createLeftViewWithFrame:(CGRect)frame
{
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    return leftView;
}

- (UIView*)createRightViewWithFrame:(CGRect)frame
{
    UIView *rightView = [[UIView alloc] initWithFrame:frame];
    self.rightView = rightView;
    self.rightViewMode = UITextFieldViewModeAlways;
    return rightView;
}

@end


















































@implementation UITextField (EDCreate)

+ (instancetype)textFieldWithFont:(UIFont*)font {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.font = font;
    textField.textColor = kFontColorBlack;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

+ (instancetype)textFieldWithFont:(UIFont*)font placeholder:(NSString*)placeholder {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.font = font;
    textField.textColor = kFontColorBlack;
    textField.placeholder = placeholder;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

+ (instancetype)textFieldWithFrame:(CGRect)frame font:(UIFont*)font {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = frame;
    textField.font = font;
    textField.textColor = kFontColorBlack;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

+ (instancetype)textFieldWithFrame:(CGRect)frame font:(UIFont*)font placeholder:(NSString*)placeholder {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = frame;
    textField.font = font;
    textField.textColor = kFontColorBlack;
    [textField setPlaceholder:placeholder color:EDHexColor(@"#CCCCCC")];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

@end
