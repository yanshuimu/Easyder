//
//  DLCBaseViewController.m
//  MusiciansAndMuslns
//
//  Created by mac on 2017/5/24.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "EDBaseViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>
#import <Photos/PHPhotoLibrary.h>

///系统版本
#define SystemVersion [[UIDevice currentDevice].systemVersion floatValue]


@interface EDBaseViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,CLLocationManagerDelegate>

{
    
    CLLocationManager *_locationManager;
}
//@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHandler;
//
@end

@implementation EDBaseViewController

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

- (BOOL)fd_prefersNavigationBarHidden{
    return NO;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    //self.view.backgroundColor = kDefaultBackgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //UINavigationBar方法setTranslucent设置为YES时，需要这行代码，UIViewController的view坐标才是从NavigationBar坐下角开始
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}

-(void)ExtendedLayout
{
    if (SystemVersion>=7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)setupNavigationReturnButton:(SEL)selector
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    UIImageView *backImgV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 9, 17)];
    backImgV.image = [UIImage imageNamed:@"return2"];
    [backImgV setCenterY:btn.centerY];
    [btn addSubview:backImgV];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

///设置导航栏其他按钮
- (void)setNavigationItemWithAction:(SEL)action
                          imageName:(NSString *)imageName
                              width:(CGFloat)width
                               left:(BOOL)left{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (width > 0)
    {
        btn.frame = CGRectMake(0, 0, width, 20);
    }
    else
    {
        btn.frame = CGRectMake(0, 0, 44, 44);
    }
    
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat x = left ? 5 : (CGRectGetWidth(btn.frame) - image.size.width - 5);
    CGFloat y = (CGRectGetHeight(btn.frame) - image.size.height)/2;
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, image.size.width, image.size.height)];
    iconView.image = image;
    [btn addSubview:iconView];
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    if (left) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -8;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,barItem];
    }
    else {
        self.navigationItem.rightBarButtonItem = barItem;
    }
}

- (UIButton*)setNavigationItemWithAction:(SEL)action
                              title:(NSString *) title
                         titleColor:(UIColor *)color
                              width:(CGFloat)width
                               left:(BOOL)left
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (width > 0) {
        btn.frame = CGRectMake(0, 0, width, 44);
    }
    else {
        [btn sizeToFit];
        btn.frame = CGRectMake(0, 0, btn.width, 44);
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    if (left) {
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -8;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,barItem];
    }
    else {
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.navigationItem.rightBarButtonItem = barItem;
    }
    return btn;
}

- (void)setNavigationItemWithAction:(SEL)action
                              title:(NSString *) title
                         titleColor:(UIColor *)color
                     borderderColor:(UIColor*)borderColor
                              width:(CGFloat)width
                               left:(BOOL)left
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = kBoldFont(14);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (width > 0) {
        btn.frame = CGRectMake(0, 0, width, 28);
    }else{
        
        [btn sizeToFit];
        btn.frame = CGRectMake(0, 0, btn.width + 20, btn.height);
    }
    btn.layer.borderColor = borderColor.CGColor;
    btn.layer.borderWidth = 0.5;
    btn.layer.cornerRadius = btn.height/2;
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    if (left) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -8;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,barItem];
    }
    else {
        self.navigationItem.rightBarButtonItem = barItem;
    }
}

- (void)setNavigationAutoSizingItemWithAction:(SEL)action
                                        title:(NSString *) title
                                   titleColor:(UIColor *)color
                                    imageName:(NSString *) imageName
                                         left:(BOOL) left{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (title && color) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:color forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];;
    }
    
    if (title) {
//        CGSize size = [EDTools stringSizeWithString:title Font:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
//        btn.frame = CGRectMake(0, 0, size.width+30, 30);
    }else
    {
        btn.frame = CGRectMake(0, 0, 80, 30);
    }
    [btn setImageEdgeInsets:UIEdgeInsetsMake(2, 10, 2, 0)];
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    if (left) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -8;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,barItem];
    }
    else {
        self.navigationItem.rightBarButtonItem = barItem;
    }
}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 选取照片
-(void)takeLocationImage{
    
    //判断是否有访问相册权限
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];

    if (photoAuthorStatus == PHAuthorizationStatusRestricted || photoAuthorStatus == PHAuthorizationStatusRestricted) {
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:@"尚未获取访问相册的权限,请打开 系统设置->qingkela 来进行设置" preferredStyle:UIAlertControllerStyleAlert];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:actionSheet animated:YES completion:nil];
    }else{
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
            UIImagePickerController *imagePick = [[UIImagePickerController alloc]init];
            imagePick.delegate = self;
            imagePick.allowsEditing = YES;
            imagePick.sourceType = sourceType;
            [self presentViewController:imagePick animated:YES completion:^{
                
            }];
        }else
        {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:@"手机不支持拍照。" preferredStyle:UIAlertControllerStyleAlert];
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:actionSheet animated:YES completion:nil];
            
            
        }
    }
}

#pragma mark 拍照
-(void)takeCameraPhoto
{
    if ([self isAvailableSelectAVCapture:AVMediaTypeVideo isphoto:YES]) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
            UIImagePickerController *imagePick = [[UIImagePickerController alloc]init];
            imagePick.delegate = self;
            imagePick.sourceType = sourceType;
            imagePick.allowsEditing = YES;
            [self presentViewController:imagePick animated:YES completion:^{
                
            }];
        }else{
            
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:@"手机不支持选择照片。" preferredStyle:UIAlertControllerStyleAlert];
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:actionSheet animated:YES completion:nil];
        }
    }
}

- (BOOL)isAvailableSelectAVCapture:(NSString *)type isphoto:(BOOL)is
{
    //判断是否有访问权限
    __block BOOL isAvalible = NO;
    BOOL showAlertView = YES;
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:type];
    if (status == AVAuthorizationStatusRestricted) {
    }else if (status == AVAuthorizationStatusDenied)
    {
    }else if (status == AVAuthorizationStatusAuthorized)
    {
        isAvalible = YES;
    }else if (status == AVAuthorizationStatusNotDetermined)
    {
        [AVCaptureDevice requestAccessForMediaType:type completionHandler:^(BOOL granted) {
            if (granted) {
                isAvalible = YES;
            }else
            {
                isAvalible = NO;
            }
        }];
        showAlertView = NO;
    } else {
    }
    if ( isAvalible==NO && showAlertView ) {
        NSString *alterStr = nil;
        if (is) {
            alterStr = @"尚未获取访问相机的权限,请打开 系统设置->qingkela 来进行设置";
        }else
        {
            alterStr = @"尚未获取访问麦克风的权限,请打 开系统设置->qingkela 来进行设置";
        }
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:alterStr preferredStyle:UIAlertControllerStyleAlert];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:actionSheet animated:YES completion:nil];
        
    }
    return isAvalible;
}

#pragma mark- 保存图片
- (void)saveImageInPhoneWithImageUrl:(NSString *)imageUrl{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"保存图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
        UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

// 指定回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(!error){
        NSLog(@"save success");
        //[self.view showLoadingMeg:@"图片已存储到你的相册中"];
    }else{
        NSLog(@"save failed");
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"存储失败" message:@"请打开 系统设置->qingkela 来进行设置" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}


#pragma mark -- cell 向右的箭头
- (UIImageView *)cellRightPointImg:(CGPoint)point{
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(point.x, point.y, 7, 12)];
    imgV.image = [UIImage imageNamed:@"direction"];
    return imgV;
}

#pragma mark -- view上下添加横线
- (void)addViewLine:(UIView *)view lineColor:(NSString *)colorStr{
    UILabel *lineTop = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, APPCONFIG_UNIT_LINE_WIDTH)];
    UILabel *lineBottom = [[UILabel alloc]initWithFrame:CGRectMake(0, view.height-0.5, SCREEN_W, APPCONFIG_UNIT_LINE_WIDTH)];
    if (colorStr == nil) {
        lineTop.backgroundColor = EDColor(@"#d2d2d2");
        lineBottom.backgroundColor = EDColor(@"#d2d2d2");
    }else{
        lineTop.backgroundColor = EDColor(colorStr);
        lineBottom.backgroundColor = EDColor(colorStr);
    }
    
    [view addSubview:lineTop];
    [view addSubview:lineBottom];
}

- (UIView*)addSingleLine:(CGRect)frame Color:(NSString*)color{
    UIView *singleLine = [[UIView alloc] initWithFrame:frame];
    singleLine.backgroundColor = EDColor(color);
    return singleLine;
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%@:内存回收", NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addRightBarButton:(NSString*)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = [title hash];
    [button addTarget:self action:@selector(rightBarClick:)
     forControlEvents:UIControlEventTouchUpInside];
    CGSize textSize = EM_TEXTSIZE(title, [UIFont systemFontOfSize:15]);
    [button setFrame:CGRectMake(0, 0, textSize.width, 35)];
    [button setContentHorizontalAlignment:
     UIControlContentHorizontalAlignmentRight];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    [self.navigationItem setRightBarButtonItem:barButton];
}

- (void)rightBarClick:(UIButton *)sender{
    
}

-(void)removeViewControllers:(NSArray *)VControllers{
    
    NSMutableArray *viewContrArr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    NSLog(@"%zd",viewContrArr.count);
  
    for (NSString *vcStr in VControllers) {
        for (UIViewController *vc in viewContrArr) {
            if ([vc isKindOfClass:[NSClassFromString(vcStr) class]]) {
                [viewContrArr removeObject:vc];
                break;
            }
        }
    }
    
    self.navigationController.viewControllers = viewContrArr;
}

- (void)pushToLoginVC{
    
}


- (void)refreshAgain{
    
}

#pragma mark - 选择图片

- (void)openCameraWithCompletion:(void(^)(UIImage *image))completion {
    
    _openCameraCompletion = completion;
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
        
    }else{
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

- (void)localPhotoWithCompletion:(void(^)(UIImage *image))completion {

    /*
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:nil];
    imagePickerVc.naviBgColor = KWhiteColor;
    imagePickerVc.naviTitleColor = KBlackColor;
    imagePickerVc.barItemTextColor = KBlackColor;
    imagePickerVc.oKButtonTitleColorNormal = kFontColorLightBlack;
    imagePickerVc.statusBarStyle = UIStatusBarStyleDefault;
    imagePickerVc.allowTakeVideo = NO;
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.maxImagesCount = 1;
    [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton) {
        [leftButton setImage:IMAGENAME(@"return2") forState:UIControlStateNormal];
    }];
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        //先把图片转成NSData  //头像用EditedImage(系统裁剪后的正方形的)
        UIImage* image = [photos firstObject];
        if (completion) completion(image);
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
     */
}

#pragma mark - 代理方法

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //先把图片转成NSData  //头像用EditedImage(系统裁剪后的正方形的)
    UIImage* image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (_openCameraCompletion) _openCameraCompletion(image);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
