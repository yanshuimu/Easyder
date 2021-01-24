//
//  EDCycleScrollView.h
//  AnJiaKe
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView/SDCycleScrollView.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDCycleScrollView : UIView

//
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

//
@property (nonatomic, copy) void (^didSelectItemAtIndexBlock)(NSInteger index);

- (void)setImageUrls:(NSArray*)imageUrls;

- (void)setPlaceholderImage:(UIImage*)placeholderImage;

@end

NS_ASSUME_NONNULL_END
