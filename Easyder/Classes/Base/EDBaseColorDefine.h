//
//  EDBaseColorDefine.h
//  PowerRamp
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 mac. All rights reserved.
//

#ifndef EDBaseColorDefine_h
#define EDBaseColorDefine_h

/********************* 颜色 ****************************/

#define EDColorRGB(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define EDColorA(r, g, b, a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define EDColor(string)  [EDBaseUtil colorWithHexString:string alpha:1]

///随机颜色
#define EDRandomColor EDColorRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

///白颜色
#define KWhiteColor [UIColor whiteColor]

///黑色
#define KBlackColor [UIColor blackColor]

//透明
#define kClearColor [UIColor clearColor]

//统一背景色
#define kDefaultBackgroundColor EDColor(@"#F5F4F9")

//统一透明度
#define kDefaultBackgroundAlpha 0.70

//app主题颜色(紫色)
#define kThemeColor [EDBaseUtil colorWithHexString:@"#246FE9" alpha:1]
//#define kThemeColor [EDBaseUtil colorWithHexString:@"#e32663" alpha:1]
#define kThemeGreenColor EDColorRGB(103, 194, 58)

//统一浅黑字体颜色
#define kFontColorLightBlack EDColor(@"#1A1A1A")

//统一深灰字体颜色
#define kFontColorLightGray EDColor(@"#999797")

//统一浅灰字体颜色
#define kFontColorDarkGray EDColor(@"#666666")

//统一线条颜色
#define kLineColor EDColor(@"#F5F4F9")

//线条颜色（深色）
#define kDarkLineColor EDColor(@"#D6D6D6")

#endif /* EDBaseColorDefine_h */
