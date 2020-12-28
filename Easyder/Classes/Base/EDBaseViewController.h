//
//  DLCBaseViewController.h
//  MusiciansAndMuslns
//
//  Created by mac on 2017/5/24.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+EDLayout.h"
#import "EDBaseUtil.h"
#import "EDBaseMacroDefine.h"
#import "EDBaseColorDefine.h"

@interface EDBaseViewController : UIViewController

//
@property (nonatomic, copy) void (^openCameraCompletion)(UIImage *image);

-(void)ExtendedLayout;

- (void)setupNavigationReturnButton:(SEL)selector;


/*
 *  设置导航栏其他按钮
 */
- (void)setNavigationItemWithAction:(SEL)action
                          imageName:(NSString *)imageName
                              width:(CGFloat)width
                               left:(BOOL) left;

- (UIButton*)setNavigationItemWithAction:(SEL)action
                              title:(NSString *) title
                         titleColor:(UIColor *)color
                              width:(CGFloat)width
                               left:(BOOL) left;

- (void)setNavigationItemWithAction:(SEL)action
                              title:(NSString *) title
                         titleColor:(UIColor *)color
                     borderderColor:(UIColor*)borderColor
                              width:(CGFloat)width
                               left:(BOOL)left;

- (void)setNavigationAutoSizingItemWithAction:(SEL)action
                                        title:(NSString *) title
                                   titleColor:(UIColor *)color
                                    imageName:(NSString *) imageName
                                         left:(BOOL) left;

- (void)goBack;

///选择照片
- (void)takeLocationImage;

///拍照
- (void)takeCameraPhoto;

#pragma mark- 保存图片
- (void)saveImageInPhoneWithImageUrl:(NSString *)imageUrl;

#pragma mark -- cell 向右的箭头
- (UIImageView *)cellRightPointImg:(CGPoint)point;
#pragma mark -- view上下添加横线
- (void)addViewLine:(UIView *)view lineColor:(NSString *)colorStr;

- (UIView*)addSingleLine:(CGRect)frame Color:(NSString*)color;

-(void)addRightBarButton:(NSString*)title;

-(void)removeViewControllers:(NSArray*)VControllers;

#pragma mark- 重新请求数据
- (void)refreshAgain;

#pragma mark- 跳转到登录界面
- (void)pushToLoginVC;

/*
 * 照相
 */
- (void)openCameraWithCompletion:(void(^)(UIImage *image))completion;

/*
 * 打开相处
 */
- (void)localPhotoWithCompletion:(void(^)(UIImage *image))completion;

@end
