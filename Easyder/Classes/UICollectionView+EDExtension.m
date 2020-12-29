//
//  UICollectionView+Extension.m
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "UICollectionView+EDExtension.h"

@implementation UICollectionView (EDExtension)

- (void)registerForCellWithClass:(Class)clazz
{
    [self registerClass:clazz forCellWithReuseIdentifier:NSStringFromClass(clazz.class)];
}

- (void)registerForSectionHeaderWithClass:(Class)clazz
{
    [self registerClass:clazz forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(clazz.class)];
}

- (void)registerForSectionFooterWithClass:(Class)clazz
{
    [self registerClass:clazz forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(clazz.class)];
}

@end
