//
//  EDBaseModel.h
//  VClub
//
//  Created by mac on 2020/12/10.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseModel : NSObject

//裁剪图片
@property (nonatomic, strong) UIImage *clipedImage;
//裁剪图片
@property (nonatomic, strong) UIImage *clipedAvatarImage;

+ (NSArray*)mj_keyValuesIgnoredKeys;

@end

NS_ASSUME_NONNULL_END
