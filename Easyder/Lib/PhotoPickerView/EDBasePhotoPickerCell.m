//
//  EDBasePhotoPickerCell.m
//  YKProjectName
//
//  Created by xuhg on 2016/12/21.
//  Copyright © 2016年 TTF. All rights reserved.
//

#import "EDBasePhotoPickerCell.h"

@interface EDBasePhotoPickerCell ()

@end

@implementation EDBasePhotoPickerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        [self prepareSubviews];
    }
    return self;
}

- (void)prepareSubviews {
    
    CGFloat x = 0; CGFloat y = 0; CGFloat width = 0; CGFloat height = 0;
    
    _photoView= [[UIImageView alloc] init];
    [_photoView setFrame:self.bounds];
    [_photoView.layer setMasksToBounds:YES];
    _photoView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_photoView];

    _coverView = [[UIView alloc] init];
    _coverView.frame = _photoView.frame;
    _coverView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
    [_coverView.layer setMasksToBounds:YES];
    [self addSubview:_coverView];
    
    _iconView = [[UIImageView alloc] init];
    _iconView.image = [UIImage imageNamed:@"xiang"];
    [_coverView addSubview:_iconView];
    width = _iconView.image.size.width;
    height = _iconView.image.size.height;
    x = CGRectGetWidth(_coverView.frame)/2 - width/2;
    y = CGRectGetHeight(_coverView.frame)/2 - height + 3;
    _iconView.frame = CGRectMake(x, y, width, height);
    
    x = 5;
    y = CGRectGetMaxY(_iconView.frame);
    width = CGRectGetWidth(_coverView.frame) - x * 2;
    height = 20;
    _descLab = [[UILabel alloc] init];
    _descLab.text = @"添加图片";
    _descLab.textColor = [UIColor whiteColor];
    _descLab.font = [UIFont systemFontOfSize:11];
    _descLab.frame = CGRectMake(x, y, width, height);
    _descLab.textAlignment = NSTextAlignmentCenter;
    [_coverView addSubview:_descLab];
    
    UIImage *deleteImage = [UIImage imageNamed:@"X"];
    _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteButton setImage:deleteImage forState:UIControlStateNormal];
    [_deleteButton setImage:deleteImage forState:UIControlStateSelected];
    [_deleteButton addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_deleteButton];
    width = deleteImage.size.width;
    height = deleteImage.size.height;
    x = CGRectGetWidth(self.frame) - width - 5;
    y = 5;
    _deleteButton.frame = CGRectMake(x, y, width, height);
}

- (void)setDefaultViewHidden:(BOOL)defaultViewHidden {
    
    if (defaultViewHidden) {
        _coverView.hidden = YES;
        _deleteButton.hidden = NO;
        _photoView.hidden = NO;
    }
    else {
        _coverView.hidden = NO;
        _deleteButton.hidden = YES;
        _photoView.hidden = YES;
    }
}

- (void)deleteButtonAction {
    
    if (self.deleteButtonCallback) {
        self.deleteButtonCallback();
    }
}

@end
