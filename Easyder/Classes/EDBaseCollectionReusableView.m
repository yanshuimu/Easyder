//
//  EDBaseCollectionReusableView.m
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDBaseCollectionReusableView.h"

@implementation EDBaseCollectionReusableView

+ (instancetype)dequeueSectionHeaderWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath {
    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
}

+ (instancetype)dequeueSectionFooterWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath {
    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
}

@end
