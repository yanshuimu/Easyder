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
        
        [self edSetupSubviews];
    }
    return self;
}

- (void)edInitialize {
    //子类重写
}

- (void)edSetupSubviews {
    //子类重写
}

- (void)edSetDataDict:(NSDictionary*)dict {
    //子类重写
}

@end
