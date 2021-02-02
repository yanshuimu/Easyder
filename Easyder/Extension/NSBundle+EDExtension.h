//
//  NSBundle+EDExtension.h
//  Easyder
//
//  Created by xuhonggui on 2020/12/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (EDExtension)

/**
 * 获取Easyder.bundle
 */
+ (instancetype)easyderBundle;

/**
 * 返回按钮图片
 */
+ (UIImage*)returnImageFromEasyderBundle;

/**
 * 根据图片名称获取Easyder.bundle中的图片
 */
+ (UIImage*)imageFromEasyderBundleWithName:(NSString*)imageName;

@end

NS_ASSUME_NONNULL_END
