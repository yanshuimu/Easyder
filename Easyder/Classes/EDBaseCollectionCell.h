//
//  EDBaseCollectionCell.h
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseCollectionCell : UICollectionViewCell

+ (instancetype)dequeueCellWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath;

- (void)edInitialize;

- (void)edSetupSubviews;

- (void)edSetDataDict:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END
