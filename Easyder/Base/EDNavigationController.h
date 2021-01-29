//
//  DLCBaseNavigationController.h
//  MusiciansAndMuslns
//
//  Created by mac on 2017/5/24.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDConfig.h"

@interface EDNavigationController : UINavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController style:(EDNavigationControllerStyle*)style;

//
@property (nonatomic, strong) EDNavigationControllerStyle *style;

@end
