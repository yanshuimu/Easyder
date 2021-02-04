//
//  EDSelectPhotoView.m
//  DYLRopeSkipping
//
//  Created by 许鸿桂 on 2017/7/22.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDSelectPhotoView.h"
#import "LGPhoto.h"
#import "AddPhotoCollectionCell.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface EDSelectPhotoView ()
<
LGPhotoPickerViewControllerDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UIActionSheetDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

@property (nonatomic, strong) UICollectionView *collectionView;
//
@property (nonatomic, strong) NSArray *localImageArray;

@end

@implementation EDSelectPhotoView

- (UICollectionView*)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView setScrollEnabled:NO];
        
        [collectionView registerClass:[AddPhotoCollectionCell class] forCellWithReuseIdentifier:@"AddPhotoCollectionCellID"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    _horizontalItemCount = 3;
    _insetForSection = UIEdgeInsetsMake(13.0, 13.0, 13.0, 13.0);
    _minimumInteritemSpacing = 10.0;
    _minimumLineSpacing = 10.0;
    
    [self addSubview:self.collectionView];
}

- (void)setFrame:(CGRect)frame {
    
    CGRect rect = self.collectionView.frame;
    rect.size.width = CGRectGetWidth(frame);
    self.collectionView.frame = rect;

    CGFloat height = [self collectionViewHeightWithItemHeight:[self itemWidth]];
    rect.size.height = height;
    self.collectionView.frame = rect;
        
    frame.size.height = height;
    
    [super setFrame:frame];
    
    if (_delegate && [_delegate respondsToSelector:@selector(photoViewDidFrameChange:frame:)]) {
        [_delegate photoViewDidFrameChange:self frame:self.collectionView.frame];
    }
}

- (void)setMinimumLineSpacing:(CGFloat)minimumLineSpacing {
    _minimumLineSpacing = minimumLineSpacing;
    
    [self updateFrame];
}

- (void)setMinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing {
    _minimumInteritemSpacing = minimumInteritemSpacing;
    
    [self updateFrame];
}

- (void)setInsetForSection:(UIEdgeInsets)insetForSection {
    _insetForSection = insetForSection;
    
    [self updateFrame];
}

- (void)setHorizontalItemCount:(NSInteger)horizontalItemCount {
    _horizontalItemCount = horizontalItemCount;
    
    [self updateFrame];
}

- (void)setLocalImageArray:(NSArray*)imageArray
{
    _localImageArray = [imageArray copy];
    
    [self updateFrame];
    [_collectionView reloadData];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return _insetForSection;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [self itemWidth];
    return CGSizeMake(width, width);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return _minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return _minimumInteritemSpacing;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _localImageArray.count < _maxImageNumber ? (_localImageArray.count + 1) : _localImageArray.count;;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    AddPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddPhotoCollectionCellID" forIndexPath:indexPath];
    
    if (indexPath.row == _localImageArray.count) {
        
        [cell.profilePhoto setImage:[UIImage imageNamed:@"details5eb"]];
        cell.closeButton.hidden = YES;
        [cell showPlaceholderView];
    }
    else{
        
        id image = _localImageArray[indexPath.item];
        
        if ([image isKindOfClass:[NSString class]]) {
            NSLog(@"NSString格式 -- %ld", [indexPath item]);
            
//            [cell.profilePhoto sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//                @strongify(self)
////                [self.localImageArray replaceObjectAtIndex:[indexPath item] withObject:cell.profilePhoto.image];
//            }];
            
        }
        else if ([image isKindOfClass:[UIImage class]]) {
            NSLog(@"图片格式-- %ld", [indexPath item]);
            [cell.profilePhoto setImage:image];
        }
        cell.closeButton.hidden = NO;
        
        [cell hidePlaceholderView];
    }
    
    cell.profilePhoto.tag = [indexPath item];
    cell.closeButton.tag = [indexPath item];
    
    [cell setDeleteButtonCallback:^(UIButton *deleteButton) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(photoView:didDeleteImageAtIndex:)]) {
            [strongSelf.delegate photoView:self didDeleteImageAtIndex:deleteButton.tag];
        }
    }];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == (_localImageArray.count)) {
        
        __weak typeof(self) weakSelf = self;
        
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertCtrl addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            __strong typeof(weakSelf) strongSelf = weakSelf;
            
            UIImagePickerController *imagePickerCtrl = [[UIImagePickerController alloc] init];
            imagePickerCtrl.allowsEditing = YES;
            imagePickerCtrl.delegate = self;
            imagePickerCtrl.sourceType = UIImagePickerControllerSourceTypeCamera;
            strongSelf.targetCtrl.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [strongSelf.targetCtrl presentViewController:imagePickerCtrl animated:YES completion:nil];
            
        }]];
        
        [alertCtrl addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
            __strong typeof(weakSelf) strongSelf = weakSelf;
            
            [strongSelf presentPhotoPickerViewControllerWithStyle:LGShowImageTypeImagePicker];
        }]];
        
        [alertCtrl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        
        [self.targetCtrl presentViewController:alertCtrl animated:YES completion:nil];
    }
    else {
            
        
//        YKLookPhotoViewController *lookPhoto = [[YKLookPhotoViewController alloc] init];
//        lookPhoto.bigImages = _localImageArray;
//        lookPhoto.num = indexPath.item;
//        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:lookPhoto];
//        nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [_targetCtrl presentViewController:nc animated:YES completion:nil];
         
    }
}

- (CGFloat)itemWidth {
    return floorf((CGRectGetWidth(_collectionView.frame) - _insetForSection.left - _insetForSection.right - (_horizontalItemCount - 1) * _minimumInteritemSpacing)/_horizontalItemCount);
}

- (CGFloat)collectionViewHeightWithItemHeight:(CGFloat)itemHeight {
    NSInteger rows = 0;
    if (_horizontalItemCount == 0) {
        return 0.0;
    }
    if (_localImageArray.count % _horizontalItemCount == 0 && _localImageArray.count > 0) {
        rows = _localImageArray.count/_horizontalItemCount;
        //加上占位图片
        if (_localImageArray.count < _maxImageNumber) {
            rows++;
        }
    }
    else {
        rows = _localImageArray.count/_horizontalItemCount + 1;
    }
    return _insetForSection.top + _insetForSection.bottom + rows * itemHeight + (rows - 1) * _minimumLineSpacing;
}

- (void)updateFrame {
    
    CGFloat height = [self collectionViewHeightWithItemHeight:[self itemWidth]];
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    
    frame = self.collectionView.frame;
    frame.size.height = height;
    self.collectionView.frame = frame;
}

- (void)presentPhotoPickerViewControllerWithStyle:(LGShowImageType)style {
    
    LGPhotoPickerViewController *pickerCtrl = [[LGPhotoPickerViewController alloc] initWithShowType:style];
    pickerCtrl.status = PickerViewShowStatusCameraRoll;
    pickerCtrl.maxCount = _maxImageNumber - _localImageArray.count; // 最多能选*张图片
    pickerCtrl.delegate = self;
    [pickerCtrl showPickerVc:_targetCtrl];
}

#pragma mark - LGPhotoPickerViewControllerDelegate

- (void)pickerViewControllerDoneAsstes:(NSArray *)assets isOriginal:(BOOL)original {
    
    for (LGPhotoAssets *photo in assets) {
                
        if (_delegate && [_delegate respondsToSelector:@selector(photoView:didPickImage:)]) {
            [_delegate photoView:self didPickImage:photo.originImage];
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    UIImage *image = nil;
    
    /* 如果选择的类型是照片 */
    if ([mediaType isEqualToString:@"public.image"]) {
        
        if ([picker allowsEditing]) {
            /* 获取用户编辑后的照片 */
            image = [info valueForKey:UIImagePickerControllerEditedImage];
        }
        else {
            /* 获取照片元数据 */
            image = [info valueForKey:UIImagePickerControllerOriginalImage];
        }
        
        if (_delegate && [_delegate respondsToSelector:@selector(photoView:didPickImage:)]) {
            [_delegate photoView:self didPickImage:image];
        }
                
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
