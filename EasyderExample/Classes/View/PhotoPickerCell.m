//
//  PhotoPickerCell.m
//  Easyder
//
//  Created by mac on 2021/2/5.
//

#import "PhotoPickerCell.h"

@implementation PhotoPickerCell

- (void)prepareSubviews {
    
    CGFloat x = 0; CGFloat y = 0; CGFloat width = 0; CGFloat height = 0;
    
    width = height = CGRectGetWidth(self.frame) - 11;
    self.photoView = [[UIImageView alloc] init];
    [self.photoView setFrame:CGRectMake(x, y, width, height)];
    [self.photoView.layer setMasksToBounds:YES];
    self.photoView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.photoView];

    self.coverView = [[UIView alloc] init];
    self.coverView.frame = self.photoView.frame;
    self.coverView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
    [self.coverView.layer setMasksToBounds:YES];
    [self addSubview:self.coverView];
    
    self.iconView = [[UIImageView alloc] init];
    self.iconView.image = [UIImage imageNamed:@"xiang"];
    [self.coverView addSubview:self.iconView];
    width = self.iconView.image.size.width;
    height = self.iconView.image.size.height;
    x = CGRectGetWidth(self.coverView.frame)/2 - width/2;
    y = CGRectGetHeight(self.coverView.frame)/2 - height + 3;
    self.iconView.frame = CGRectMake(x, y, width, height);
    
    x = 5;
    y = CGRectGetMaxY(self.iconView.frame);
    width = CGRectGetWidth(self.coverView.frame) - x * 2;
    height = 20;
    self.descLab = [[UILabel alloc] init];
    self.descLab.text = @"添加图片";
    self.descLab.textColor = [UIColor whiteColor];
    self.descLab.font = [UIFont systemFontOfSize:11];
    self.descLab.frame = CGRectMake(x, y, width, height);
    self.descLab.textAlignment = NSTextAlignmentCenter;
    [self.coverView addSubview:self.descLab];
    
    UIImage *deleteImage = [UIImage imageNamed:@"X"];
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deleteButton setImage:deleteImage forState:UIControlStateNormal];
    [self.deleteButton setImage:deleteImage forState:UIControlStateSelected];
    [self.deleteButton addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.deleteButton];
    width = deleteImage.size.width;
    height = deleteImage.size.height;
    x = CGRectGetWidth(self.coverView.frame)/2 - width/2;
    y = CGRectGetHeight(self.frame) - height;
    self.deleteButton.frame = CGRectMake(x, y, width, height);
}

@end
