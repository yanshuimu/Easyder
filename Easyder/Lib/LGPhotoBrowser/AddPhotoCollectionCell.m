//
//  AddPhotoCollectionCell.m
//  YKProjectName
//
//  Created by xuhg on 2016/12/21.
//  Copyright © 2016年 TTF. All rights reserved.
//

#import "AddPhotoCollectionCell.h"

@interface AddPhotoCollectionCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *descLab;

@end

@interface AddPhotoCollectionCell ()
{
    CGFloat _selfW;
    CGFloat _selfH;
}

@end

@implementation AddPhotoCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        _selfW = frame.size.width;
        _selfH = frame.size.height;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self prepareSubviews];
    }
    return self;
}

- (void)prepareSubviews {
    
    _profilePhoto= [[UIImageView alloc] init];
    [_profilePhoto setFrame:CGRectMake(0, 0, _selfW, _selfH)];
    [_profilePhoto.layer setCornerRadius:5];
    [_profilePhoto.layer setMasksToBounds:YES];
    //_profilePhoto.backgroundColor = kDefaultBackgroundColor;
    _profilePhoto.backgroundColor = [UIColor redColor];
    _profilePhoto.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_profilePhoto];

    _iconView = [[UIImageView alloc] init];
    [_iconView setFrame:CGRectMake(_selfW/2 - 11.5, _selfH/2 - 19, 23, 18)];
    _iconView.image = [UIImage imageNamed:@"camera_front"];
    _iconView.backgroundColor = [UIColor blueColor];
    [self addSubview:_iconView];
    
    _descLab = [[UILabel alloc] init];
    _descLab.text = @"添加图片";
    _descLab.textColor = [UIColor darkGrayColor];
    _descLab.font = [UIFont systemFontOfSize:13];
    _descLab.frame = CGRectMake(0, CGRectGetMaxY(_iconView.frame) + 5, _selfW, 20);
    _descLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_descLab];
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeButton setImage:[UIImage imageNamed:@"X"] forState:UIControlStateNormal];
    [_closeButton setImage:[UIImage imageNamed:@"X"] forState:UIControlStateSelected];
    [_closeButton setFrame:CGRectMake(_selfW - 29, 5, 24, 24)];
    [_closeButton addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_closeButton];
    
}

- (void)showPlaceholderView
{
    _iconView.hidden = YES;
    _descLab.hidden = YES;
}

- (void)hidePlaceholderView
{
    _iconView.hidden = YES;
    _descLab.hidden = YES;
}

- (void)setBigImgViewWithImage:(UIImage *)img{
    
    if (_BigImgView) {
        _BigImgView.frame = _profilePhoto.frame;
        _BigImgView.image = img;
    }
    else{
        _BigImgView = [[UIImageView alloc]initWithImage:img];
        _BigImgView.frame = _profilePhoto.frame;
        [self insertSubview:_BigImgView atIndex:0];
    }
    _BigImgView.contentMode = UIViewContentModeScaleToFill;
}

- (void)deleteButtonAction {
    
    if (self.deleteButtonCallback) {
        self.deleteButtonCallback(_closeButton);
    }
}

@end
