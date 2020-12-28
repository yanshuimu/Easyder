//
//  DropDownButton.h
//  AnJiaKe
//
//  Created by apple on 2020/5/17.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DropDownButton : UIButton

//是否带有箭头
@property (nonatomic, assign) BOOL withArrow;
//
@property (nonatomic, assign) BOOL up;
//
@property (nonatomic, strong) UIImage *downImage;
//
@property (nonatomic, strong) UIImage *upImage;
//
@property (nonatomic, strong) UIImage *defaultImage;
//
@property (nonatomic, strong) UIColor *normalTitleColor;
//
@property (nonatomic, strong) UIColor *selectedTitleColor;

- (void)reset;

@end

NS_ASSUME_NONNULL_END
