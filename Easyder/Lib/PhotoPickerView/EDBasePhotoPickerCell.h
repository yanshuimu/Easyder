//
//  EDBasePhotoPickerCell.h
//  YKProjectName
//
//  Created by xuhg on 2016/12/21.
//  Copyright © 2016年 TTF. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 *********************************************************************************
 *
 * 继承该类后重新prepareSubviews方法实现自定义
 *
 *********************************************************************************
 
 */

@interface EDBasePhotoPickerCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *photoView;
//
@property (nonatomic, strong) UIView *coverView;
//
@property (nonatomic, strong) UIButton *deleteButton;
//
@property (nonatomic, strong) UIImageView *iconView;
//
@property (nonatomic, strong) UILabel *descLab;
//
@property (nonatomic, assign) BOOL defaultViewHidden;

@property (nonatomic, copy) void (^deleteButtonCallback)(void);

- (void)deleteButtonAction;

@end
