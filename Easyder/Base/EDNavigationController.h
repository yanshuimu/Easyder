//
//  DLCBaseNavigationController.h
//  MusiciansAndMuslns
//
//  Created by xuhonggui on 2017/5/24.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDConfig.h"

@interface EDNavigationController : UINavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController style:(EDNavigationControllerStyle*)style;

//
@property (nonatomic, strong) EDNavigationControllerStyle *style;

@end
