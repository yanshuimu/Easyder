//
//  UICollectionView+Extension.m
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "UICollectionView+EDExtension.h"

@implementation UICollectionView (EDExtension)

- (void)registerForCellWithClass:(Class)class
{
    [self registerClass:class forCellWithReuseIdentifier:NSStringFromClass(class.class)];
}

- (void)registerForSectionHeaderWithClass:(Class)class
{
    [self registerClass:class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(class.class)];
}

- (void)registerForSectionFooterWithClass:(Class)class
{
    [self registerClass:class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(class.class)];
}

@end
