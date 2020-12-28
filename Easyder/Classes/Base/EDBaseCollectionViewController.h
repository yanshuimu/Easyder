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

- (void)createRefreshHeader;

- (void)createRefreshFooter;

- (void)headerRefreshData;

- (void)footerRefreshData;

- (UICollectionReusableView*)createDefaultCollectionSectionViewWithKind:(NSString *)kind indexPath:(NSIndexPath*)indexPath;

- (UICollectionViewCell*)createDefaultCollectionCell:(UICollectionView*)collectionView ndexPath:(NSIndexPath*)indexPath;

@end

NS_ASSUME_NONNULL_END
