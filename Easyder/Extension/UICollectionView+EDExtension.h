//
//  UICollectionView+Extension.h
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (EDUtils)

- (void)registerForCellWithClass:(Class)clazz;

- (void)registerForSectionHeaderWithClass:(Class)clazz;

- (void)registerForSectionFooterWithClass:(Class)clazz;

@end

NS_ASSUME_NONNULL_END
