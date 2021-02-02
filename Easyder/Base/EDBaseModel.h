//
//  EDBaseModel.h
//  Easyder
//
//  Created by xuhonggui on 2020/12/10.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseModel : NSObject

//裁剪图片
@property (nonatomic, strong) UIImage *clipedImage;
//裁剪图片
@property (nonatomic, strong) UIImage *clipedAvatarImage;

/**
 * 模型转字典忽略指定Keys
 */
+ (NSArray*)mj_keyValuesIgnoredKeys;

@end

NS_ASSUME_NONNULL_END
