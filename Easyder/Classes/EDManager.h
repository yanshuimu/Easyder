//
//  EDManager.h
//  Easyder
//
//  Created by mac on 2020/12/29.
//

#import <Foundation/Foundation.h>
#import "EDBaseMacroDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface EDManager : NSObject

+ (instancetype)shareManager;

//水平缩放比例
@property (nonatomic, assign) CGFloat widthRatio;
//垂直缩放比例
@property (nonatomic, assign) CGFloat heightRatio;
//主题色
@property (nonatomic, strong) UIColor *themeColor;

@end

NS_ASSUME_NONNULL_END
