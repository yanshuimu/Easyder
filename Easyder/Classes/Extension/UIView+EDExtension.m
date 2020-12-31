//
//  UIView+EDExtension.m
//  EasyderDemo
//
//  Created by mac on 2020/12/25.
//

#import "UIView+EDExtension.h"
#import <SDWebImage/SDWebImage.h>
#import <EDBaseMacroDefine.h>
#import <EDBaseModel.h>
#import <UIImage+EDExtension.h>
#import <EDBaseView.h>

@implementation UIView (EDLayout)

/*
 自动缩放宽高
 */
CGSize CGSizeAutoMake(CGFloat width, CGFloat height)
{
    CGSize size;
    size.width = trunc(width * EDManagerSingleton.widthRatio);
    size.height = size.width * height/width;
    return size;
}

/*
 自动缩放宽度
 */
CGFloat CGWidthAutoMake(CGFloat width) {
    
    return trunc(width * EDManagerSingleton.widthRatio);
}

/*
 自动缩放高度
 */
CGFloat CGHeightAutoMake(CGFloat height) {
    
    return trunc(height * EDManagerSingleton.heightRatio);
}

@dynamic top;
@dynamic bottom;
@dynamic left;
@dynamic right;

@dynamic width;
@dynamic height;

@dynamic size;

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end



















































#define kDefaultShowTime 1.5

#pragma mark - Loading

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
    hudView.detailsLabel.font = EDFont(13);
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




















































#pragma mark - 设置圆角

@implementation UIView (EDCore)

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

@end





























































#pragma mark - 其他

@implementation UIView (EDUtils)

- (UIViewController*)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)addTarget:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

- (void)removeChildViews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (CGSize)autoFitSize {
    [self sizeToFit];
    return self.frame.size;
}

@end



















































@implementation UIView (EDOptimize)

@end

#pragma mark - UILabel

@implementation UILabel (EDOptimize)

- (void)optimize_setBlendedLayersWithBackgroundColor:(UIColor*)backgroundColor  {
    
    self.backgroundColor = backgroundColor;
    self.layer.masksToBounds = YES;
}

@end

#pragma mark - UIImageView

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
















































@implementation UIView (EDCreate)

+ (instancetype)viewWithFrame:(CGRect)frame {
    
    EDBaseView *view = [[self alloc] initWithFrame:frame];
    return view;
}

+ (instancetype)viewWithBackgroundColor:(UIColor*)backgroundColor {
    
    EDBaseView *view = [[self alloc] init];
    view.backgroundColor = backgroundColor;
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



















































@implementation UIView (LYEmptyView)

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(LYActionTapBlock)block{
    [self configBlankPage:blankPageType hasData:hasData hasError:hasError offsetY:0 reloadButtonBlock:block];
}

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError offsetY:(CGFloat)offsetY reloadButtonBlock:(LYActionTapBlock)block{
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
        NSString *imageName, *tipStr;
        NSString *buttonTitle;
        if (hasError) {
            //        加载失败
            tipStr = @"呀，网络出了问题";
            imageName = @"empty_jd";
            buttonTitle = @"重新连接网络";
        }else{
            //        空白数据
            switch (blankPageType) {
                case EaseBlankPageTypeConsume: {//消费明细
                    tipStr = @"没有消费记录";
                }
                    break;
                case EaseBlankPageTypeSearch: {//搜索
                    tipStr = @"没有搜索结果";
                }
                    break;
                case EaseBlankPageTypeShoppingCart: {//购物车
                    tipStr = @"购物车为空";
                    imageName = @"transaction6";
                }
                    break;
                case EaseBlankPageTypeShoppingCartMemberSearch: {//购物车搜索
                    tipStr = @"没有搜索结果";
                    imageName = @"transaction4_small";
                }
                    break;
                default://其它页面（这里没有提到的页面，都属于其它）
                {
                    tipStr = @"暂时没有内容";
                }
                    break;
            }
        }
        imageName = imageName ?: @"details14";
        
        LYEmptyView *emptyV = [LYEmptyView emptyActionViewWithImageStr:imageName titleStr:tipStr detailStr:nil btnTitleStr:buttonTitle btnClickBlock:block];
        emptyV.autoShowEmptyView = NO;
        emptyV.actionBtnBackGroundColor = EDThemeColor;
        emptyV.actionBtnTitleColor = EDWhiteColor;
        emptyV.titleLabFont = EDFont(12);
        emptyV.titleLabTextColor = EDFontColorLightGray;
        self.ly_emptyView = emptyV;
        
        //    布局
        if (ABS(offsetY) > 0) {
            self.ly_emptyView.contentViewOffset = offsetY;
        }
        
        [self ly_showEmptyView];
    }
}

@end
