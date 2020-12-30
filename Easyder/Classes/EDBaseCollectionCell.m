//
//  EDBaseCollectionCell.m
//  AnJiaKe
//
//  Created by apple on 2020/5/16.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDBaseCollectionCell.h"

@implementation EDBaseCollectionCell

+ (instancetype)dequeueCellWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath*)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self edInitialize];
    }
    return self;
}

- (void)edInitialize {
    
    [self edSetupSubviews];
}

- (void)edSetupSubviews {
    //子类实现
}

- (void)edSetDataDict:(NSDictionary*)dict {
    //子类实现
}

@end
