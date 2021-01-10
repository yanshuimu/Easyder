//
//  UIAlertController+EDExtension.h
//  AnJiaKe
//
//  Created by mac on 2020/5/23.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertControllerBlock)(void);

@interface UIAlertController (EDUtils)

/**
 * 警告弹窗
 */
+ (instancetype)alertControllerWithTitle:(NSString*)title
                                message:(NSString*)message
                              leftTitle:(NSString*)leftTitle
                             rightTitle:(NSString*)rightTitle
                             leftAction:(AlertControllerBlock)leftAction
                            rightAction:(AlertControllerBlock)rightAction;

/**
 * 菜单弹窗
 */
+ (instancetype)actionSheetWithTitle:(NSString*)title
                             message:(NSString*)message
                          titleArray:(NSArray*)titleArray
                         actionArray:(NSArray*)actionArray
                         cancelTitle:(NSString*)cancelTitle
                        cancelAction:(AlertControllerBlock)cancelAction;

@end
