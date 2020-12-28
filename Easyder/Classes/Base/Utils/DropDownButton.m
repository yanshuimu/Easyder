//
//  DropDownButton.m
//  AnJiaKe
//
//  Created by apple on 2020/5/17.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "DropDownButton.h"

@implementation DropDownButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect labRect = self.titleLabel.frame;
    CGRect imgRect = self.imageView.frame;
    
    if (imgRect.size.width > 0) {
        labRect.origin.x = self.width/2 - labRect.size.width/2 - 5;
        imgRect.origin.x = labRect.origin.x + labRect.size.width + 5;
    } else {
        labRect.origin.x = self.width/2 - labRect.size.width/2;
    }
    
    self.titleLabel.frame = labRect;
    self.imageView.frame = imgRect;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    if (_withArrow) {
        [super setImage:image forState:state];
    }
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}

- (void)setUp:(BOOL)up
{
    _up = up;
    if (up) {
        [self setImage:_upImage forState:UIControlStateNormal];
    }
    else {
        [self setImage:_downImage forState:UIControlStateNormal];
    }
    [self setTitleColor:_selectedTitleColor forState:UIControlStateNormal];
}

- (void)reset {
    
    _up = NO;
    self.selected = NO;
    [self setImage:_defaultImage forState:UIControlStateNormal];
    [self setTitleColor:_normalTitleColor forState:UIControlStateNormal];
}

@end
