//
//  AddPhotoCollectionCell.h
//  YKProjectName
//
//  Created by xuhg on 2016/12/21.
//  Copyright © 2016年 TTF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPhotoCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *profilePhoto;

@property (nonatomic, strong) UIButton *closeButton;

@property(nonatomic,strong) UIImageView *BigImgView;

@property (nonatomic, copy) void (^deleteButtonCallback)(UIButton *btn);

- (void)setBigImgViewWithImage:(UIImage *)img;

- (void)showPlaceholderView;
- (void)hidePlaceholderView;

@end
