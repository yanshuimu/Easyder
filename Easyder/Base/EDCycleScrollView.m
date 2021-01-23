//
//  EDCycleScrollView.m
//  AnJiaKe
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDCycleScrollView.h"
#import "UIView+EDExtension.h"
#import "SDCycleScrollView.h"
#import "UIColor+EDExtension.h"
#import "EasyderManager.h"

@interface EDCycleScrollView ()<SDCycleScrollViewDelegate>
//
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation EDCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
        
        [self setupSubviews];
    }
    return self;
}

- (void)initialize {
    
}

- (void)setupSubviews {
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = self.height;
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(x, y, width, height) delegate:self placeholderImage:[UIImage imageNamed:DEFAULT_IMAGE_RECTANGLE]];
    _cycleScrollView.backgroundColor = [UIColor clearColor];
    _cycleScrollView.hidesForSinglePage = YES;
    _cycleScrollView.pageDotColor = [UIColor whiteColor];
    _cycleScrollView.currentPageDotColor = EDManagerSingleton.themeColor;
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.autoScrollTimeInterval = 4.0f;
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_cycleScrollView];
}

- (void)setImageUrls:(NSArray*)imageUrls {
    _cycleScrollView.imageURLStringsGroup = imageUrls;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (_didSelectItemAtIndexBlock) {
        _didSelectItemAtIndexBlock(index);
    }
}

@end
