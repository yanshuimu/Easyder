//
//  EDSelectPhotoView.h
//  DYLRopeSkipping
//
//  Created by 许鸿桂 on 2017/7/22.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EDSelectPhotoView;

@protocol EDSelectPhotoViewDelegate <NSObject>

@optional
- (void)photoView:(EDSelectPhotoView*)photoView didPickImage:(UIImage*)image;
- (void)photoView:(EDSelectPhotoView*)photoView didDeleteImageAtIndex:(NSInteger)index;
- (void)photoViewDidFrameChange:(EDSelectPhotoView*)photoView frame:(CGRect)frame;
@end

@interface EDSelectPhotoView : UIView

@property (nonatomic, strong) UIViewController *targetCtrl;

@property (nonatomic, weak) id<EDSelectPhotoViewDelegate> delegate;
//
@property (nonatomic, assign) NSInteger maxImageNumber;

- (void)setLocalImageArray:(NSArray*)imageArray;
//水平方向图片个数，默认值为3
@property (nonatomic, assign) NSInteger horizontalItemCount;
//水平行间距，默认值为10.0
@property (nonatomic, assign) CGFloat minimumLineSpacing;
//垂直行间距，默认值为10.0
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
//四周边距，默认值为UIEdgeInsetsMake(13.0, 13.0, 13.0, 13.0)
@property (nonatomic, assign) UIEdgeInsets insetForSection;

@end
