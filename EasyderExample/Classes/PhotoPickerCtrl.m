//
//  PhotoPickerCtrl.m
//  Easyder
//
//  Created by mac on 2021/2/3.
//

#import "PhotoPickerCtrl.h"
#import "EDPhotoPickerView.h"
#import "PhotoPickerCell.h"

@interface PhotoPickerCtrl ()<EDPhotoPickerViewDelegate>
//
@property (nonatomic, strong) EDPhotoPickerView *photoPickerView;
//
@property (nonatomic, strong) NSMutableArray *localImageArray;
@end

@implementation PhotoPickerCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _localImageArray = [NSMutableArray array];
    
    [self setupSubviews];
}

- (void)setupSubviews {
 
    CGFloat x = 0; CGFloat y = 0; CGFloat width = 0; CGFloat height = 0;
    
    width = SCREEN_W;
    _photoPickerView = [[EDPhotoPickerView alloc] init];
    _photoPickerView.frame = CGRectMake(x, y, width, height);
    _photoPickerView.maxCount = 20;
    _photoPickerView.horizontalItemCount = 5;
    _photoPickerView.minimumInteritemSpacing = 0.0;
    _photoPickerView.targetCtrl = self;
    _photoPickerView.delegate = self;
    _photoPickerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_photoPickerView];
}

- (void)photoPickerView:(EDPhotoPickerView*)photoPickerView didPickImage:(UIImage*)image {
    
    [_localImageArray addObject:image];
    
    [photoPickerView setDataArray:_localImageArray];
}

- (void)photoPickerView:(EDPhotoPickerView*)photoPickerView didDeleteImageAtIndex:(NSInteger)index {
    
    [_localImageArray removeObjectAtIndex:index];
    
    [photoPickerView setDataArray:_localImageArray];
}

- (void)photoPickerView:(EDPhotoPickerView*)photoPickerView didFrameChanged:(CGRect)frame {
    
    
}

- (Class)photoPickerView:(EDPhotoPickerView*)photoPickerView cellClassForCollectionView:(UICollectionView *)collectionView {
        
    return PhotoPickerCell.class;
}

@end
