//
//  EDBaseCollectionReusableView.h
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseCollectionReusableView : UICollectionReusableView

+ (instancetype)dequeueSectionHeaderWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath;

+ (instancetype)dequeueSectionFooterWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath;

- (void)initialize;

@end

NS_ASSUME_NONNULL_END
