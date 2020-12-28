//
//  EDBaseCollectionViewController.m
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDBaseCollectionViewController.h"
#import "EDBaseMacroDefine.h"

#define DefaultCollectionCellID @"DefaultCollectionCellID"
#define DefaultCollectionSectionHeaderID @"DefaultCollectionSectionHeaderID"
#define DefaultCollectionSectionFooterID @"DefaultCollectionSectionFooterID"

@interface EDBaseCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation EDBaseCollectionViewController

@synthesize collectionView = _collectionView;
@synthesize dataArray = _dataArray;
@synthesize page = _page;

- (UICollectionView*)collectionView {
    if (!_collectionView) {
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat width = SCREEN_W;
        CGFloat height = SCREEN_H - kNavBar_H - kViewBottom_H;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(x, y, width, height) collectionViewLayout:flowLayout];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        [_collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:DefaultCollectionCellID];
        [_collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DefaultCollectionSectionHeaderID];
        [_collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DefaultCollectionSectionFooterID];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _page = 1;
    _dataArray = [NSMutableArray array];
    [self.view addSubview:self.collectionView];
    [self.view sendSubviewToBack:self.collectionView];
//    self.view.backgroundColor = kDefaultBackgroundColor;
    self.collectionView.backgroundColor = [UIColor clearColor];
}

- (void)createRefreshHeader
{
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshData)];
}

- (void)createRefreshFooter
{
    _collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshData)];
}

- (UICollectionReusableView*)createDefaultCollectionSectionViewWithKind:(NSString *)kind indexPath:(NSIndexPath*)indexPath
{
    if ([kind isEqualToString: UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *view = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:DefaultCollectionSectionHeaderID forIndexPath:indexPath];
        return view;
    }
    else if ([kind isEqualToString: UICollectionElementKindSectionFooter])
    {
        
        UICollectionReusableView *view = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:DefaultCollectionSectionFooterID forIndexPath:indexPath];
        return view;
    }
    return nil;
}

- (UICollectionViewCell*)createDefaultCollectionCell:(UICollectionView*)collectionView ndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DefaultCollectionCellID
                                                                           forIndexPath:indexPath];
    return cell;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeZero;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self createDefaultCollectionCell:collectionView ndexPath:indexPath];
}

#pragma mark <UICollectionViewDelegate>

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

#pragma mark-- section内部的上下间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if ([kind isEqualToString: UICollectionElementKindSectionHeader])
    {
        
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:DefaultCollectionSectionHeaderID forIndexPath:indexPath];
        return view;
    }
    else if ([kind isEqualToString: UICollectionElementKindSectionFooter])
    {
        
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:DefaultCollectionSectionFooterID forIndexPath:indexPath];
        return view;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)headerRefreshData
{
    
}

- (void)footerRefreshData
{
    
}

@end
