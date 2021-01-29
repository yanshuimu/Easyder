//
//  UIView+EDBase.m
//  Easyder
//
//  Created by mac on 2021/1/8.
//

#import "EDBase+Extension.h"
#import <objc/message.h>
#import <SDWebImage/SDWebImage.h>
#import "EasyderManager.h"
#import "EDUtils.h"
#import "NSBundle+EDExtension.h"
#import "UIColor+EDExtension.h"
#import "UIImage+EDExtension.h"
#import "UIColor+EDExtension.h"
#import "EDBaseModel.h"
#import "EDBaseView.h"
#import "EDBaseMacroDefine.h"
#import "UIView+EDExtension.h"
#import "EDNetApiManager.h"
#import "EDBaseTableViewController.h"
#import "EDBaseCollectionViewController.h"

@implementation UIView (EDBase)

CGSize CGSizeAutoMake(CGFloat width, CGFloat height)
{
    CGSize size;
    size.width = trunc(width * EDManagerSingleton.widthRatio);
    size.height = size.width * height/width;
    return size;
}

CGFloat CGWidthAutoMake(CGFloat width) {
    
    return trunc(width * EDManagerSingleton.widthRatio);
}

CGFloat CGHeightAutoMake(CGFloat height) {
    
    return trunc(height * EDManagerSingleton.heightRatio);
}

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation UIView (EDEmptyView)

- (void)configEmptyPage:(NSInteger)emptyPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(LYActionTapBlock)block{
    
    [self configEmptyPage:emptyPageType hasData:hasData hasError:hasError offsetY:0 reloadButtonBlock:block];
}

- (void)configEmptyPage:(NSInteger)emptyPageType hasData:(BOOL)hasData hasMoreData:(BOOL)hasMoreData hasError:(BOOL)hasError reloadButtonBlock:(LYActionTapBlock)block{
    
    [self configEmptyPage:emptyPageType hasData:hasData hasError:hasError offsetY:0 reloadButtonBlock:block];
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        [EDUtils configRefreshWithScrollView:(UIScrollView*)self hasMoreData:hasMoreData hasError:hasError];
    }
}

- (void)configEmptyPage:(NSInteger)emptyPageType hasData:(BOOL)hasData hasError:(BOOL)hasError offsetY:(CGFloat)offsetY reloadButtonBlock:(LYActionTapBlock)block {
    
    [self configEmptyPage:emptyPageType style:[EDConfig emptyViewStyle] hasData:hasData hasError:hasError offsetY:offsetY reloadButtonBlock:block];
}

- (void)configEmptyPage:(NSInteger)emptyPageType style:(EDEmptyViewStyle*)style hasData:(BOOL)hasData hasError:(BOOL)hasError offsetY:(CGFloat)offsetY reloadButtonBlock:(LYActionTapBlock)block{
    
    if (hasData) {
        if (self.ly_emptyView) {
            [self ly_hideEmptyView];
            [self.ly_emptyView removeFromSuperview];
        }
    }else{
        
        if (hasData) {
            [self ly_hideEmptyView];
            [self.ly_emptyView removeFromSuperview];
            return;
        }
        self.alpha = 1.0;
        NSString *imageName, *tipStr, *buttonTitle;
                
        if (hasError) {
            //加载失败
            tipStr = style.networkErrorTitle;
            buttonTitle = style.networkErrorButtonTitle;
            imageName = style.networkErrorImageName;
            
        }else{
            //block中自定义判断逻辑
            if (style.conditionsBlock) {
                style.conditionsBlock(emptyPageType);
            }
        }
        imageName = imageName ? : style.imageName;
        buttonTitle = buttonTitle ? : style.buttonTitle;
        
        LYEmptyView *emptyV = [LYEmptyView emptyActionViewWithImageStr:imageName titleStr:style.title detailStr:nil btnTitleStr:buttonTitle btnClickBlock:block];
        
        if ([EDUtils stringIsEmpty:imageName]) {
            if (hasError) {
                emptyV.image = [NSBundle imageFromEasyderBundleWithName:@"network_error"];
            }
            else {
                emptyV.image = [NSBundle imageFromEasyderBundleWithName:@"empty"];
            }
        }
        
        emptyV.autoShowEmptyView = NO;
        emptyV.actionBtnBackGroundColor = style.buttonBackgroundColor;
        emptyV.actionBtnTitleColor = style.buttonTitleColor;
        emptyV.titleLabFont = style.titleFont;
        emptyV.titleLabTextColor = style.titleColor;
        emptyV.actionBtnHeight = style.buttonHeight;
        emptyV.actionBtnCornerRadius = style.buttonCornerRadius;
        emptyV.actionBtnBorderWidth = style.buttonBorderWidth;
        emptyV.actionBtnBorderColor = style.buttonBorderColor;
        
        self.ly_emptyView = emptyV;
        
        //    布局
        if (ABS(offsetY) > 0) {
            self.ly_emptyView.contentViewOffset = offsetY;
        }
        
        [self ly_showEmptyView];
    }
}

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

#define kDefaultShowTime 1.5

@implementation UIView (Loading)

- (MBProgressHUD*)showLoading
{
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    
    MBProgressHUD *hudView = [MBProgressHUD HUDForView:self];
    if (!hudView) {
        hudView = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    else
    {
        [self bringSubviewToFront:hudView];
        [hudView showAnimated:YES];
    }
    hudView.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hudView.bezelView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    return hudView;
}

- (MBProgressHUD*)showLoadingMeg:(NSString *)meg
{
    MBProgressHUD *hudView = [self showLoadingMeg:meg time:kDefaultShowTime];
    return hudView;
}

- (MBProgressHUD*)showLoadingMeg:(NSString *)meg time:(NSUInteger)time
{
    
    MBProgressHUD *hudView = [MBProgressHUD HUDForView:self];
    if (!hudView) {
        hudView = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    else
    {
        [hudView showAnimated:YES];
    }
    hudView.margin = 12;
    hudView.mode = MBProgressHUDModeText;
    hudView.detailsLabel.text = meg;
    hudView.detailsLabel.font = [UIFont systemFontOfSize:13];
    hudView.detailsLabel.textColor = [UIColor whiteColor];
    hudView.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hudView.bezelView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    if (time > 0) {
        [self performSelector:@selector(hideLoading) withObject:nil afterDelay:time];
    }
    return hudView;
}

- (void)showLoadingMeg:(NSString *)meg withImageName:(NSString *)imageName time:(NSUInteger)time
{
    MBProgressHUD *hud = [self showLoadingMeg:meg];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

- (void)hideLoading
{
    [MBProgressHUD hideHUDForView:self animated:NO];
}

- (void)delayHideLoading
{
    [self performSelector:@selector(hideLoading) withObject:nil afterDelay:kDefaultShowTime];
}

- (void)hideLoadingAfterDelay:(NSTimeInterval)delay
{
    [self performSelector:@selector(hideLoading) withObject:nil afterDelay:delay];
}

- (void)setLoadingUserInterfaceEnable:(BOOL)enable
{
    [MBProgressHUD HUDForView:self].userInteractionEnabled = enable;
}
@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation MBProgressHUD (EDExtension)

+ (void)showLoading
{
    [EDKeyWindow showLoading];
}

+ (void)showLoadingMeg:(NSString *)meg
{
    [EDKeyWindow showLoadingMeg:meg time:kDefaultShowTime];
}

+ (void)showLoadingMeg:(NSString *)meg time:(NSUInteger)time
{
    [EDKeyWindow showLoadingMeg:meg time:time];
}

+ (void)showLoadingMeg:(NSString *)meg withImageName:(NSString *)imageName time:(NSUInteger)time
{
    [EDKeyWindow showLoadingMeg:meg withImageName:imageName time:time];
}

+ (void)hideLoading
{
    [EDKeyWindow hideLoading];
}

+ (void)delayHideLoading
{
    [EDKeyWindow delayHideLoading];
}

+ (void)hideLoadingAfterDelay:(NSTimeInterval)delay
{
    [EDKeyWindow hideLoadingAfterDelay:delay];
}

+ (void)setLoadingUserInterfaceEnable:(BOOL)enable
{
    [EDKeyWindow setLoadingUserInterfaceEnable:enable];
}

@end
///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation UIView (EDOptimize)

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation UILabel (EDOptimize)

- (void)optimize_setBlendedLayersWithBackgroundColor:(UIColor*)backgroundColor  {
    
    self.backgroundColor = backgroundColor;
    self.layer.masksToBounds = YES;
}

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation UIImageView (EDOptimize)

+ (void)optimize_setImageWithURL:(NSString*)url radius:(CGFloat)radius imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model {
    
    [self optimize_setImageWithURL:url placeholder:[UIImage imageNamed:DEFAULT_IMAGE_SQUARE] corners:UIRectCornerAllCorners radius:radius cornersColor:[UIColor whiteColor] imageDownloader:imageDownloader imageShowView:imageShowView model:model];
}

+ (void)optimize_setImageWithURL:(NSString*)url placeholder:(UIImage*)placeholder radius:(CGFloat)radius imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model {
    
    [self optimize_setImageWithURL:url placeholder:placeholder corners:UIRectCornerAllCorners radius:radius cornersColor:[UIColor whiteColor] imageDownloader:imageDownloader imageShowView:imageShowView model:model];
}

+ (void)optimize_setImageWithURL:(NSString*)url radius:(CGFloat)radius cornersColor:(UIColor*)cornersColor imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model {
    
    [self optimize_setImageWithURL:url placeholder:[UIImage imageNamed:DEFAULT_IMAGE_SQUARE] corners:UIRectCornerAllCorners radius:radius cornersColor:cornersColor imageDownloader:imageDownloader imageShowView:imageShowView model:model];
}

+ (void)optimize_setImageWithURL:(NSString*)url corners:(UIRectCorner)corners radius:(CGFloat)radius imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model {
    
    [self optimize_setImageWithURL:url placeholder:[UIImage imageNamed:DEFAULT_IMAGE_SQUARE] corners:corners radius:radius cornersColor:[UIColor whiteColor] imageDownloader:imageDownloader imageShowView:imageShowView model:model];
}

+ (void)optimize_setImageWithURL:(NSString*)url corners:(UIRectCorner)corners radius:(CGFloat)radius cornersColor:(UIColor*)cornersColor imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model {
    
    [self optimize_setImageWithURL:url placeholder:[UIImage imageNamed:DEFAULT_IMAGE_SQUARE] corners:corners radius:radius cornersColor:cornersColor imageDownloader:imageDownloader imageShowView:imageShowView model:model];
}

+ (void)optimize_setImageWithURL:(NSString*)url placeholder:(UIImage*)placeholder corners:(UIRectCorner)corners radius:(CGFloat)radius cornersColor:(UIColor*)cornersColor imageDownloader:(UIImageView*)imageDownloader imageShowView:(UIImageView*)imageShowView model:(EDBaseModel*)model {
    
    if (EDStringIsEmpty(url)) {
        
        imageShowView.image = placeholder;
        return;
    }
    
    if (model.clipedImage) {
        
        imageShowView.image = model.clipedImage;
    }
    else {
        
        //imageShowView.image = placeholder;
        
        [imageDownloader optimize_setImageWithURL:url targetSize:imageShowView.size parentColor:cornersColor radius:radius complete:^(UIImage * _Nonnull sourceImage, UIImage * _Nonnull clipedImage, NSError * _Nullable error) {
            
            if (error) {
                
                imageShowView.image = placeholder;
            }
            else if (clipedImage) {
                
                model.clipedImage = clipedImage;
                imageShowView.image = model.clipedImage;
            }
        }];
    }
}

- (void)optimize_setBackgoundColor:(UIColor*)backgroundColor parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius  {
    
    //生成背景图片
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
        
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [backgroundColor CGColor]);
        CGContextFillRect(context, rect);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImage *circleImage = [image redrawWithRoundedCorners:corners
                                                        radius:radius
                                               backgroundColor:parentColor];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = circleImage;
        });
    });
}

- (void)optimize_setRedrawAlphaImage:(UIImage*)image parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius  {
            
    if (!image) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
        UIImage *circleImage = [image redrawWithRoundedCorners:corners
                                                        radius:radius
                                               backgroundColor:parentColor];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = circleImage;
        });
    });
}

- (void)optimize_setRedrawAlphaImage:(UIImage*)image parentColor:(UIColor*)parentColor {
         
    if (!image) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
        UIImage *circleImage = [image redrawWithBackgroundColor:parentColor];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = circleImage;
        });
    });
}

- (void)optimize_setRedrawImage:(UIImage*)image parentColor:(UIColor*)parentColor corners:(UIRectCorner)corners radius:(CGFloat)radius {
        
    if (!image) {
        return;
    }
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGFloat actualRadius = 0.0;
        
        if (image.size.width > image.size.height) {
            
            actualRadius = radius * image.size.height/height;
        }
        else {
            
            actualRadius = radius * image.size.width/width;
        }
        
        UIImage *circleImage = [image imageWithRoundedSize:CGSizeMake(width, height) backgroundColor:parentColor corners:corners
                                                    radius:actualRadius];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = circleImage;
        });
    });
}

- (void)optimize_setImageWithURL:(NSString*)url parentColor:(UIColor*)parentColor radius:(CGFloat)radius {
    
    EDWeakSelf
        
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    
        if (image) {
            
            CGFloat width = self.frame.size.width;
            CGFloat height = self.frame.size.height;
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                CGFloat actualRadius = 0.0;
                
                if (image.size.width > image.size.height) {
                    
                    actualRadius = radius * image.size.height/height;
                }
                else {
                    
                    actualRadius = radius * image.size.width/width;
                }
                
                UIImage *circleImage = [image imageWithRoundedSize:CGSizeMake(width, height) backgroundColor:parentColor
                                                           corners:UIRectCornerAllCorners radius:actualRadius];
                                
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.image = circleImage;
                });
            });
        }
    }];
}

- (void)optimize_setImageWithURL:(NSString*)url targetSize:(CGSize)targetSize parentColor:(UIColor*)parentColor  corners:(UIRectCorner)corners radius:(CGFloat)radius complete:(OptimizeCompletionBlock)complete {
    
    if (EDStringIsEmpty(url)) {
        return;
    }
            
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    
        if (image) {
            
            CGFloat width = targetSize.width;
            CGFloat height = targetSize.height;
            
            if (height == MAXFLOAT) {
                height = image.size.height * width/image.size.width;
            }
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                CGFloat actualRadius = 0.0;
                
                if (image.size.width > image.size.height) {
                    
                    actualRadius = radius * image.size.height/height;
                }
                else {
                    
                    actualRadius = radius * image.size.width/width;
                }
                
                UIImage *circleImage = [image imageWithRoundedSize:CGSizeMake(width, height)
                                                   backgroundColor:parentColor
                                                           corners:corners radius:actualRadius];
                                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (complete) complete(image ,circleImage, error);
                });
            });
        }
        else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) complete(image, nil, error);
            });
        }
    }];
}

- (void)optimize_setImageWithURL:(NSString*)url targetSize:(CGSize)targetSize parentColor:(UIColor*)parentColor radius:(CGFloat)radius complete:(OptimizeCompletionBlock)complete {
    
    [self optimize_setImageWithURL:url targetSize:targetSize parentColor:parentColor corners:UIRectCornerAllCorners radius:radius complete:complete];
}

- (void)optimize_setImageWithURL:(NSString*)url placeholderImage:(UIImage*)image parentColor:(UIColor*)parentColor radius:(CGFloat)radius {
    
    EDWeakSelf
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:image completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    
        if (image) {
            
            CGFloat width = weakSelf.frame.size.width;
            CGFloat height = weakSelf.frame.size.height;
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                CGFloat actualRadius = 0.0;
                
                if (image.size.width > image.size.height) {
                    
                    actualRadius = radius * image.size.height/height;
                }
                else {
                    
                    actualRadius = radius * image.size.width/width;
                }
            
                UIImage *circleImage = [image imageWithRoundedSize:CGSizeMake(width, height)
                                                   backgroundColor:parentColor
                                                           corners:UIRectCornerAllCorners radius:actualRadius];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.image = circleImage;
                });
            });
        }
    }];
}

- (void)optimize_setBorderRoundedImageWithURL:(NSString*)url parentColor:(UIColor*)parentColor borderColor:(UIColor*)borderColor borderWidth:(CGFloat)borderWidth {
    
    EDWeakSelf
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    
        if (image) {
            
            CGFloat width = weakSelf.frame.size.width;
            CGFloat height = weakSelf.frame.size.height;
            CGFloat radius = height/2;
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                CGFloat actualRadius = 0.0;
                
                if (image.size.width > image.size.height) {
                    
                    actualRadius = radius * image.size.height/height;
                }
                else {
                    
                    actualRadius = radius * image.size.width/width;
                }
            
                UIImage *circleImage = [image imageWithRoundedSize:CGSizeMake(width, height)
                                                   backgroundColor:parentColor
                                                           corners:UIRectCornerAllCorners radius:actualRadius];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.image = circleImage;
                });
            });
        }
    }];
}

- (CAShapeLayer*)optimize_roundedBorderWithRadius:(CGFloat)radius borderColor:(UIColor*)borderColor borderWidth:(CGFloat)borderWidth {
            
    //边框
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius - 20 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    path.lineWidth = borderWidth;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = borderColor.CGColor;
    
    return shapeLayer;
}

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation UIView (EDCreate)

+ (instancetype)viewWithBackgroundColor:(UIColor*)backgroundColor {
    
    EDBaseView *view = [[self alloc] init];
    view.backgroundColor = backgroundColor;
    return view;
}

+ (instancetype)viewWithFrame:(CGRect)frame {
    
    EDBaseView *view = [[self alloc] initWithFrame:frame];
    return view;
}

+ (instancetype)viewWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor {
    
    EDBaseView *view = [[self alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    
    return view;
}

+ (instancetype)viewWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor cornerRadius:(CGFloat)cornerRadius {
    
    EDBaseView *view = [[self alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    [view addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    return view;
}

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@implementation NSObject (Network)

- (UIView*)findLoadingView {
    
    UIView *view = nil;
    if ([self isKindOfClass:UIViewController.class]) {
        view = ((UIViewController*)self).view;
    }
    else if ([self isKindOfClass:UIView.class]) {
        view = (UIView*)self;
    }
    return view;
}

- (void)requestPostWithParams:(id)params url:(NSString *)url response:(NetResponse)response {
    
    [self requestPostWithParams:params url:url showMsg:NO response:response];
}

- (void)requestPostWithParams:(id)params url:(NSString *)url showMsg:(BOOL)showMsg response:(NetResponse)response {
    
    UIView *view = [self findLoadingView];
    
    [view showLoading];
        
    [EDNetApiManager requestPostWithParams:params url:url response:^(BOOL netSuccess, BOOL dataSuccess, NSString *msg, id responseObject) {
            
        if (netSuccess && dataSuccess) {
            
            showMsg ? [view showLoadingMeg:msg] : [view hideLoading];
            
            if (response) response(responseObject);
        }
        else {
            
            [view showLoadingMeg:msg];
        }
    }];
}

- (void)requestPostWithBodyParams:(id)params url:(NSString *)url response:(NetResponse)response {
    
    [self requestPostWithBodyParams:params url:url showMsg:NO response:response];
}

- (void)requestPostWithBodyParams:(id)params url:(NSString *)url showMsg:(BOOL)showMsg response:(NetResponse)response {
    
    UIView *view = [self findLoadingView];
    
    [view showLoading];
        
    [EDNetApiManager requestPostWithBodyParams:params url:url response:^(BOOL netSuccess, BOOL dataSuccess, NSString *msg, id responseObject) {
            
        if (netSuccess && dataSuccess) {
            
            showMsg ? [view showLoadingMeg:msg] : [view hideLoading];
            
            if (response) response(responseObject);
        }
        else {
            
            [view showLoadingMeg:msg];
        }
    }];
}

- (void)requestPaginationWithParams:(id)params url:(NSString *)url reloadSelector:(SEL)reloadSelector response:(NetResponse)response {
    
    __weak typeof(self) weakSelf = self;
    
    UIView *view = [self findLoadingView];
    
    [view showLoading];
        
    [EDNetApiManager requestPostWithParams:params url:url response:^(BOOL netSuccess, BOOL dataSuccess, NSString *msg, id responseObject) {
        
        BOOL hasMoreData = NO;
        NSInteger currentPage = 0;
        UIScrollView *scrollView = nil;
        NSMutableArray *dataArray = nil;
        id<EDPaginationDelegate> paginationDelegate = nil;
        
        if ([weakSelf conformsToProtocol:@protocol(EDPaginationDelegate)]) {
            paginationDelegate = ((id (*)(id, SEL))objc_msgSend)(self, sel_registerName("paginationDelegate"));
        }
        
        if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(dataArrayForPagination)]) {
            dataArray = [paginationDelegate dataArrayForPagination];
        }
        
        if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(currentPageForPagination)]) {
            currentPage = [paginationDelegate currentPageForPagination];
        }
        
        if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(scrollViewForPagination)]) {
            scrollView = [paginationDelegate scrollViewForPagination];
        }
        
        if (netSuccess && dataSuccess) {
            
            [view hideLoading];
            
            if (currentPage == 1) {
                [dataArray removeAllObjects];
            }
            
            if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(incrementPageForPagination)]) {
                [paginationDelegate incrementPageForPagination];
            }
                     
            if (response) response(responseObject);
            
            if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(hasMoreDataForPagination:)]) {
                hasMoreData = [paginationDelegate hasMoreDataForPagination:responseObject];
            }
        }
        else {
            
            [view showLoadingMeg:msg];
        }
        
        [scrollView configEmptyPage:0 hasData:dataArray.count > 0 hasMoreData:hasMoreData hasError:!netSuccess reloadButtonBlock:^{
            [weakSelf performSelectorOnMainThread:reloadSelector withObject:nil waitUntilDone:NO];
        }];
    }];
}

- (void)requestPaginationWithBodyParams:(id)params url:(NSString *)url reloadSelector:(SEL)reloadSelector response:(NetResponse)response {
    
    __weak typeof(self) weakSelf = self;
    
    UIView *view = [self findLoadingView];
    
    [view showLoading];
        
    [EDNetApiManager requestPostWithBodyParams:params url:url response:^(BOOL netSuccess, BOOL dataSuccess, NSString *msg, id responseObject) {
        
        BOOL hasMoreData = NO;
        NSInteger currentPage = 0;
        UIScrollView *scrollView = nil;
        NSMutableArray *dataArray = nil;
        id<EDPaginationDelegate> paginationDelegate = nil;
        
        if ([weakSelf conformsToProtocol:@protocol(EDPaginationDelegate)]) {
            paginationDelegate = ((id (*)(id, SEL))objc_msgSend)(self, sel_registerName("paginationDelegate"));
        }
        
        if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(dataArrayForPagination)]) {
            dataArray = [paginationDelegate dataArrayForPagination];
        }
        
        if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(currentPageForPagination)]) {
            currentPage = [paginationDelegate currentPageForPagination];
        }
        
        if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(scrollViewForPagination)]) {
            scrollView = [paginationDelegate scrollViewForPagination];
        }
        
        if (netSuccess && dataSuccess) {
            
            [view hideLoading];
            
            if (currentPage == 1) {
                [dataArray removeAllObjects];
            }
            
            if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(incrementPageForPagination)]) {
                [paginationDelegate incrementPageForPagination];
            }
                     
            if (response) response(responseObject);
            
            if (paginationDelegate && [paginationDelegate respondsToSelector:@selector(hasMoreDataForPagination:)]) {
                hasMoreData = [paginationDelegate hasMoreDataForPagination:responseObject];
            }
        }
        else {
            
            [view showLoadingMeg:msg];
        }
        
        [scrollView configEmptyPage:0 hasData:dataArray.count > 0 hasMoreData:hasMoreData hasError:!netSuccess reloadButtonBlock:^{
            [weakSelf performSelectorOnMainThread:reloadSelector withObject:nil waitUntilDone:NO];
        }];
    }];
}

@end
