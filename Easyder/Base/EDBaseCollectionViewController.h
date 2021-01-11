//
//  EDBaseCollectionViewController.h
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseCollectionViewController : EDBaseViewController
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
    NSInteger _page;
}
//
@property (nonatomic, strong) UICollectionView *collectionView;
//
@property (nonatomic, strong) NSMutableArray *dataArray;
//
@property (nonatomic, assign) NSInteger page;

/*
 * 创建下拉刷新视图
 */
- (void)createRefreshHeader;

/*
 * 创建上拉刷新视图
 */
- (void)createRefreshFooter;

/*
 * 同时创建上拉、下拉刷新视图
 */
- (void)createRefreshHeaderFooter;

/*
 * 下拉刷新方法
 */
- (void)headerRefreshData;

/*
 * 上拉加载更多方法
 */
- (void)footerRefreshData;

- (UICollectionReusableView*)createDefaultCollectionSectionViewWithKind:(NSString *)kind indexPath:(NSIndexPath*)indexPath;

- (UICollectionViewCell*)createDefaultCollectionCell:(UICollectionView*)collectionView ndexPath:(NSIndexPath*)indexPath;

@end

NS_ASSUME_NONNULL_END
