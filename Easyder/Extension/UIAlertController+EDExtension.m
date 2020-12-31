//
//  UIAlertController+EDExtension.m
//  AnJiaKe
//
//  Created by mac on 2020/5/23.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "UIAlertController+EDExtension.h"

@implementation UIAlertController (EDUtils)

+ (UIAlertController*)alertControllerWithTitle:(NSString*)title
                                       message:(nullable NSString*)message
                                     leftTitle:(NSString*)leftTitle
                                    rightTitle:(NSString*)rightTitle
                                    leftAction:(nullable void(^)(void))leftAction
                                   rightAction:(void(^)(void))rightAction {
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (leftTitle.length > 0) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (leftAction)leftAction();
        }];
        [vc addAction:action1];
    }
    
    if (rightTitle.length > 0) {
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (rightAction)rightAction();
        }];
        [vc addAction:action2];
    }
    
    return vc;
}

+ (UIAlertController*)actionSheetWithTitle:(NSString*)title
                                   message:(nullable NSString*)message
                                titleArray:(NSArray*)titleArray
                               actionArray:(NSArray*)actionArray
                               cancelTitle:(NSString*)cancelTitle
                              cancelAction:(nullable void(^)(void))cancelAction
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int i = 0; i < titleArray.count; i++) {
        alertControllerBlock actionBlock = actionArray[i];
        [vc addAction:[UIAlertAction actionWithTitle:titleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (actionBlock) actionBlock();
        }]];
    }
    
    [vc addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelAction) cancelAction();
    }]];
    return vc;
}

@end
