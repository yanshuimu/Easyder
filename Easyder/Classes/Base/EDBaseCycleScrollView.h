//
//  EDBaseCycleScrollView.h
//  AnJiaKe
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseCycleScrollView : EDBaseView

//
@property (nonatomic, copy) void (^didSelectItemAtIndex)(NSInteger index);

- (void)setImageUrls:(NSArray*)imageUrls;

@end

NS_ASSUME_NONNULL_END
