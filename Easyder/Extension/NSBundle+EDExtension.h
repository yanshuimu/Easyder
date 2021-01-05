//
//  NSBundle+EDExtension.h
//  Easyder
//
//  Created by mac on 2020/12/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (EDExtension)

+ (instancetype)easyderBundle;

+ (UIImage*)returnImageFromEasyderBundle;

+ (UIImage*)imageFromEasyderBundleWithName:(NSString*)imageName;

@end

NS_ASSUME_NONNULL_END
