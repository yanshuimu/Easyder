//
//  UICollectionView+Extension.m
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "UICollectionView+Extension.h"

@implementation UICollectionView (Extension)

- (void)registerClassForCellWithClass:(Class)class
{
    [self registerClass:class forCellWithReuseIdentifier:NSStringFromClass(class.class)];
}

- (void)registerClassForSectionHeaderWithClass:(Class)class
{
    [self registerClass:class
             forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                    withReuseIdentifier:NSStringFromClass(class.class)];
}

- (void)registerClassForSectionFooterWithClass:(Class)class
{
    [self registerClass:class
             forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                    withReuseIdentifier:NSStringFromClass(class.class)];
}

@end
