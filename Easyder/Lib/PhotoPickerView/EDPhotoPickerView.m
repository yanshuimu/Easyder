//
//  EDPhotoPickerView.m
//  DYLRopeSkipping
//
//  Created by 许鸿桂 on 2017/7/22.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDPhotoPickerView.h"
#import <SDWebImage/SDWebImage.h>
#import "LGPhoto.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface EDPhotoPickerView ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
LGPhotoPickerViewControllerDelegate,
LGPhotoPickerBrowserViewControllerDelegate,
LGPhotoPickerBrowserViewControllerDataSource
>

@property (nonatomic, strong) UICollectionView *collectionView;
//
@property (nonatomic, strong) NSMutableArray *photoBrowserDataArray;
//
@property (nonatomic, copy) NSString *cellIdentifier;
@end

@implementation EDPhotoPickerView

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
        
        _cellIdentifier = @"EDBasePhotoPickerCell";
        [collectionView registerClass:[EDBasePhotoPickerCell class] forCellWithReuseIdentifier:_cellIdentifier];
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

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    _modalPresentationStyle = UIModalPresentationFullScreen;
    _horizontalItemCount = 3;
    _insetForSection = UIEdgeInsetsMake(13.0, 13.0, 13.0, 13.0);
    _minimumInteritemSpacing = 10.0;
    _minimumLineSpacing = 10.0;
    
    _photoBrowserDataArray = [NSMutableArray array];
    
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
    
    if (_delegate && [_delegate respondsToSelector:@selector(photoPickerView:didFrameChanged:)]) {
        [_delegate photoPickerView:self didFrameChanged:self.collectionView.frame];
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

- (void)setDataArray:(NSArray *)dataArray {
    
    _dataArray = [dataArray copy];
    
    [self updateFrame];
    [_collectionView reloadData];
    
    [_photoBrowserDataArray removeAllObjects];
    
    for (int i = 0; i < _dataArray.count; i++) {
        id image = _dataArray[i];
        if ([image isKindOfClass:[NSString class]]) {
            LGPhotoPickerBrowserPhoto *photo = [[LGPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = image;
            [_photoBrowserDataArray addObject:photo];
        }
        else if ([image isKindOfClass:[UIImage class]]) {
            LGPhotoPickerBrowserPhoto *photo = [[LGPhotoPickerBrowserPhoto alloc] init];
            photo.photoImage = image;
            [_photoBrowserDataArray addObject:photo];
        }
    }
}

- (void)setDelegate:(id<EDPhotoPickerViewDelegate>)delegate {
    _delegate = delegate;
    
    if ([_delegate respondsToSelector:@selector(photoPickerView:cellClassForCollectionView:)]) {
        Class class = [_delegate photoPickerView:self cellClassForCollectionView:self.collectionView];
        _cellIdentifier = NSStringFromClass(class);
        [self.collectionView registerClass:class forCellWithReuseIdentifier:_cellIdentifier];
    }
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
    return _dataArray.count < _maxCount ? (_dataArray.count + 1) : _dataArray.count;;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    EDBasePhotoPickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == _dataArray.count) {
                
        cell.defaultViewHidden = NO;
    }
    else{
        
        id image = _dataArray[indexPath.item];
        
        if ([image isKindOfClass:[NSString class]]) {
            
            [cell.photoView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:_placeholderImage];
        }
        else if ([image isKindOfClass:[UIImage class]]) {
            
            [cell.photoView setImage:image];
        }
        
        cell.defaultViewHidden = YES;
    }
        
    [cell setDeleteButtonCallback:^{
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(photoPickerView:didDeleteImageAtIndex:)]) {
            [strongSelf.delegate photoPickerView:self didDeleteImageAtIndex:indexPath.item];
        }
    }];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == (_dataArray.count)) {
        
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
            
        [self pushPhotoBroswerWithStyle:LGShowImageTypeImageBroswer];
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
    if (_dataArray.count % _horizontalItemCount == 0 && _dataArray.count > 0) {
        rows = _dataArray.count/_horizontalItemCount;
        //加上占位图片
        if (_dataArray.count < _maxCount) {
            rows++;
        }
    }
    else {
        rows = _dataArray.count/_horizontalItemCount + 1;
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
    pickerCtrl.modalPresentationStyle = _modalPresentationStyle;
    pickerCtrl.status = PickerViewShowStatusCameraRoll;
    pickerCtrl.maxCount = _maxCount - _dataArray.count;
    pickerCtrl.delegate = self;
    [pickerCtrl showPickerVc:_targetCtrl];
}

- (void)pushPhotoBroswerWithStyle:(LGShowImageType)style {
    
    LGPhotoPickerBrowserViewController *broswerCtrl = [[LGPhotoPickerBrowserViewController alloc] init];
    broswerCtrl.modalPresentationStyle = _modalPresentationStyle;
    broswerCtrl.delegate = self;
    broswerCtrl.dataSource = self;
    broswerCtrl.showType = style;
    [self.targetCtrl presentViewController:broswerCtrl animated:YES completion:nil];
}

#pragma mark - LGPhotoPickerViewControllerDelegate

- (void)pickerViewControllerDoneAsstes:(NSArray *)assets isOriginal:(BOOL)original {
    
    for (LGPhotoAssets *photo in assets) {
        if (_delegate && [_delegate respondsToSelector:@selector(photoPickerView:didPickImage:)]) {
            [_delegate photoPickerView:self didPickImage:photo.originImage];
        }
    }
}

#pragma mark - LGPhotoPickerBrowserViewControllerDataSource

- (NSInteger)photoBrowser:(LGPhotoPickerBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section {
    return self.photoBrowserDataArray.count;
}

- (id<LGPhotoPickerBrowserPhoto>)photoBrowser:(LGPhotoPickerBrowserViewController *)pickerBrowser photoAtIndexPath:(NSIndexPath *)indexPath{
    return self.photoBrowserDataArray[indexPath.item];
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
        
        if (_delegate && [_delegate respondsToSelector:@selector(photoPickerView:didPickImage:)]) {
            [_delegate photoPickerView:self didPickImage:image];
        }
                
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
