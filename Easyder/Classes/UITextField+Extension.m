//
//  UITextField+Extension.m
//  Kehouyi
//
//  Created by apple on 2019/8/4.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

- (void)setPlaceholderColor:(UIColor*)color
{
    //[self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

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
