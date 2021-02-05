//
//  EDPhotoPickerView.h
//  DYLRopeSkipping
//
//  Created by 许鸿桂 on 2017/7/22.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDBasePhotoPickerCell.h"

@class EDPhotoPickerView;

@protocol EDPhotoPickerViewDelegate <NSObject>

@optional

/**
 * 选择图片成功后回调，在该方法中调用后台上传图片接口，上传成功后重新赋值photoPickerView的dataArray刷新界面
 */
- (void)photoPickerView:(EDPhotoPickerView*)photoPickerView didPickImage:(UIImage*)image;

/**
 * 删除图片时回调，在该方法中删除图片，并重新赋值photoPickerView的dataArray刷新界面
 */
- (void)photoPickerView:(EDPhotoPickerView*)photoPickerView didDeleteImageAtIndex:(NSInteger)index;

/**
 * EDPhotoPickerView的frame发生改变时回调，该方法会多次调用
 */
- (void)photoPickerView:(EDPhotoPickerView*)photoPickerView didFrameChanged:(CGRect)frame;

/**
 * 自定义UICollectionCell，需继承EDBasePhotoPickerCell，返回子类的Class
 */
- (Class)photoPickerView:(EDPhotoPickerView*)photoPickerView cellClassForCollectionView:(UICollectionView *)collectionView;

@end

@interface EDPhotoPickerView : UIView
//用于弹出相册、拍照
@property (nonatomic, strong) UIViewController *targetCtrl;

@property (nonatomic, weak) id<EDPhotoPickerViewDelegate> delegate;
//弹出相册、拍照时的样式
@property (nonatomic, assign) UIModalPresentationStyle modalPresentationStyle;
//占位图
@property (nonatomic, strong) UIImage *placeholderImage;
//最大选择数量
@property (nonatomic, assign) NSInteger maxCount;
//图片数组，元素允许为UIImage或者图片url
@property (nonatomic, strong) NSArray *dataArray;
//水平方向图片个数，默认值为3
@property (nonatomic, assign) NSInteger horizontalItemCount;
//水平行间距，默认值为10.0
@property (nonatomic, assign) CGFloat minimumLineSpacing;
//垂直行间距，默认值为10.0
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
//四周边距，默认值为UIEdgeInsetsMake(13.0, 13.0, 13.0, 13.0)
@property (nonatomic, assign) UIEdgeInsets insetForSection;

@end
