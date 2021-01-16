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

- (void)initialize;

- (void)setupSubviews;

- (void)setDataDict:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END
