//
//  EDBaseCycleScrollView.m
//  AnJiaKe
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDBaseCycleScrollView.h"
#import "SDCycleScrollView.h"

@interface EDBaseCycleScrollView ()<SDCycleScrollViewDelegate>
//
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation EDBaseCycleScrollView

- (void)initialize
{
    [self setupSubviews];
}

- (void)setupSubviews
{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = SCREEN_W;
    CGFloat height = self.height;
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(x, y, width, height) delegate:self placeholderImage:IMAGENAME(DEFAULT_IMAGE_RECTANGLE)];
    _cycleScrollView.backgroundColor = [UIColor clearColor];
    _cycleScrollView.hidesForSinglePage = YES;
    _cycleScrollView.pageDotColor = KWhiteColor;
    _cycleScrollView.currentPageDotColor = kThemeColor;
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.autoScrollTimeInterval = 4.0f;
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_cycleScrollView];
    
}

- (void)setImageUrls:(NSArray*)imageUrls
{
    _cycleScrollView.imageURLStringsGroup = imageUrls;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (_didSelectItemAtIndex) {
        _didSelectItemAtIndex(index);
    }
}

@end
