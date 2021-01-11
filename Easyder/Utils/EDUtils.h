//
//  DLCTools.h
//  MusiciansAndMuslns
//
//  Created by huabing jiang on 2017/5/24.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EDUtils : NSObject

/**
 * md5加密
 */
+ (NSString*)md5:(NSString*)input;

/**
 * base64加密
 */
+ (NSString*)base64StringFromText:(NSString*)text;

/**
 * base64解密
 */
+ (NSString*)textFromBase64String:(NSString*)base64;

/**
 * 给HTML加上图片自适应屏幕宽度和文字适配屏幕换行
 */
+(NSString*)importHtmlHead:(NSString*)html;

/**
 * html图文详情空态页
 */
+ (NSString*)htmlEmptyView;

/**
 * 生成二维码图片
 */
+ (UIImage*)createQRCodeWithContent:(NSString*)content;

/**
 * 生成黑白图片
 */
+ (UIImage*)getGrayImage:(UIImage*)sourceImage;

/**
 * 将NSArray中的NSNull类型转化成@""
 */
+ (id)changeType:(id)myObj;

/**
 * 16进制颜色码转UIColor
 */
+ (UIColor*)colorWithHexString:(NSString*)hexString alpha:(CGFloat)alpha;

/**
 * 下拉刷新/上拉加载更多控件结束刷新
 */
+ (void)configRefreshWithScrollView:(UIScrollView*)scrollView hasMoreData:(BOOL)hasMoreData hasError:(BOOL)hasError;

/**
 * 从拼接图片url字符串获取第一张图片url
 */
+ (NSString*)firstImageUrlFromUrlComponents:(NSString*)urlComponents;

/**
 * 字符串判空
 */
+ (BOOL)stringIsEmpty:(NSString*)string;

/**
 * 安全字符串
 */
+ (NSString*)safeString:(NSString*)string;

@end
