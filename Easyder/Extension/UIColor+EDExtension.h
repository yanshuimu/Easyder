//
//  UIColor+EDExtension.h
//  Easyder
//
//  Created by xuhonggui on 2021/1/8.
//

#import <UIKit/UIKit.h>

//统一透明度
#define EDDefaultBackgroundAlpha 0.70

#define EDColorRGB(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define EDColorA(r, g, b, a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define EDHexColor(string)  [UIColor colorWithHexString:string alpha:1.0]

//随机颜色
#define EDRandomColor EDColorRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//白色
#define EDWhiteColor [UIColor whiteColor]

//黑色
#define EDBlackColor [UIColor blackColor]

//透明
#define EDClearColor [UIColor clearColor]

//背景色 245,245,245
#define EDDefaultBackgroudColor EDHexColor(@"#F5F5F5")

//线条颜色 230,230,230
#define EDLineColor EDHexColor(@"#E6E6E6")

//黑色字体，默认字体颜色 51,51,51
#define EDFontColorBlack EDHexColor(@"#333333")

//浅黑字体，偏次要字体颜色
#define EDFontColorLightBlack EDHexColor(@"#666666")

//浅灰字体，次要字体颜色，如备注、日期等 153,153,153
#define EDFontColorLightGray EDHexColor(@"#999999")

NS_ASSUME_NONNULL_BEGIN

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface UIColor (EDExtension)

/**
 * 十六进制颜色码生成UIColor
 */
+ (UIColor*)colorWithHexString:(NSString*)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
