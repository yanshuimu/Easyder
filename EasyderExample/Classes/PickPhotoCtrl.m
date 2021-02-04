//
//  PickPhotoCtrl.m
//  Easyder
//
//  Created by mac on 2021/2/3.
//

#import "PickPhotoCtrl.h"
#import "EDSelectPhotoView.h"

@interface PickPhotoCtrl ()<EDSelectPhotoViewDelegate>
//
@property (nonatomic, strong) EDSelectPhotoView *photoView;
//
@property (nonatomic, strong) NSMutableArray *localImageArray;
@end

@implementation PickPhotoCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _localImageArray = [NSMutableArray array];
    
    [self setupSubviews];
}

- (void)setupSubviews {
 
    CGFloat x = 0; CGFloat y = 0; CGFloat width = 0; CGFloat height = 0;
    
    width = SCREEN_W;
    _photoView = [[EDSelectPhotoView alloc] init];
    _photoView.frame = CGRectMake(x, y, width, height);
    _photoView.maxImageNumber = 20;
    _photoView.horizontalItemCount = 5;
//    _photoView.minimumLineSpacing = 50.0;
//    _photoView.minimumInteritemSpacing = 60.0;
//    _photoView.insetForSection = UIEdgeInsetsMake(10.0, 20.0, 30.0, 40.0);
    _photoView.targetCtrl = self;
    _photoView.delegate = self;
    _photoView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_photoView];
}

- (void)photoView:(EDSelectPhotoView*)photoView didPickImage:(UIImage*)image {
    
    [_localImageArray addObject:image];
    
    [photoView setLocalImageArray:_localImageArray];
}

- (void)photoView:(EDSelectPhotoView*)photoView didDeleteImageAtIndex:(NSInteger)index {
    
    [_localImageArray removeObjectAtIndex:index];
    
    [photoView setLocalImageArray:_localImageArray];
}

- (void)photoViewDidFrameChange:(EDSelectPhotoView*)photoView frame:(CGRect)frame {
    
    
}

@end
