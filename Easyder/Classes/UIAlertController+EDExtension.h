//
//  UIAlertController+EDExtension.h
//  AnJiaKe
//
//  Created by mac on 2020/5/23.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^alertControllerBlock)(void);

@interface UIAlertController (EDUtils)

+ (UIAlertController*)alertControllerWithTitle:(NSString*)title
                                       message:(nullable NSString*)message
                                     leftTitle:(NSString*)leftTitle
                                    rightTitle:(NSString*)rightTitle
                                    leftAction:(nullable void(^)(void))leftAction
                                   rightAction:(void(^)(void))rightAction;

+ (UIAlertController*)actionSheetWithTitle:(NSString*)title
                                   message:(nullable NSString*)message
                                titleArray:(NSArray*)titleArray
                               actionArray:(NSArray*)actionArray
                               cancelTitle:(NSString*)cancelTitle
                              cancelAction:(nullable void(^)(void))cancelAction;

@end

NS_ASSUME_NONNULL_END
