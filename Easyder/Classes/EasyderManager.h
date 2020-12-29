//
//  EasyderManager.h
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import <Foundation/Foundation.h>

#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

#import <UIView+EDExtension.h>
#import <UITableView+EDExtension.h>
#import <UICollectionView+EDExtension.h>
#import <UIAlertController+EDExtension.h>
#import <UITextField+EDExtension.h>
#import <UITextView+EDExtension.h>

#import <EDBaseView.h>
#import <EDBaseTableCell.h>
#import <EDBaseCollectionCell.h>
#import <EDBaseCollectionReusableView.h>
#import <EDBaseViewController.h>
#import <EDBaseTableViewController.h>
#import <EDBaseCollectionViewController.h>
#import <EDBaseNavigationController.h>


NS_ASSUME_NONNULL_BEGIN

@interface EasyderManager : NSObject

+ (instancetype)shareManager;

//水平缩放比例
@property (nonatomic, assign) CGFloat widthRatio;
//垂直缩放比例
@property (nonatomic, assign) CGFloat heightRatio;
//主题色
@property (nonatomic, strong) UIColor *themeColor;

@end

NS_ASSUME_NONNULL_END
