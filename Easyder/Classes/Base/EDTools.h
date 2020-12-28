//
//  DLCTools.h
//  MusiciansAndMuslns
//
//  Created by huabing jiang on 2017/5/24.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EDTools : NSObject

#pragma mark - 颜色转换
///十六进制color转为UIColor
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert alpha:(CGFloat)alpha;

#pragma mark - 手机号码正则
///手机号码正则
+(BOOL)phoneNumberRegularExpression:(NSString*)phoneNumber;

#pragma mark - 银行卡号加入*并四位一个空格
///银行卡号加入*并四位一个空格
+(NSString *)getNewBankNumWitOldBankNum:(NSString *)bankNum;

///银行卡号四位一个空格
+(NSString *)getNewBankNumForSpaceWitOldBankNum:(NSString *)bankNum;

///实现银行卡号的输入
+(BOOL)getNewBankNumWithTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

///是否静音
+(BOOL)silenced;

/**
 * 判断是否为新版本
 */
+(BOOL)isNewVersion;

///计算字符串 size
+ (CGSize)stringSizeWithString:(NSString*)string Font:(UIFont *)font constrainedToSize:(CGSize)size;

///NSData转dictonary
+(NSDictionary*)returnDictionaryWithDataPath:(NSData*)data;


///创建UILabel
+ (UILabel *)createUILabelFrame:(CGRect)rect
                 withBackColor:(UIColor *)bgColor
                 withTextColor:(UIColor *)textColor
                  withTextFont:(UIFont *)font
             withTextAlignment:(NSTextAlignment)alignment
               withTextContent:(NSString *)content;

#pragma mark - 将NSDate对象转换为字符串,需带格式化符号
///@brief 将NSDate对象转换为字符串,需带格式化符号
+(NSString *)tansformTime:(NSDate *)date DateFormat:(NSString *)dateFormat;



#pragma mark - 加载自定义nib文件
///加载自定义nib文件
+ (id)loadViewOfClass:(Class) clazz;

#pragma mark - 时间戳
///时间戳转换工具
+ (NSString *)timeTrand:(int)timeV;
+ (NSDate *) convertNSDateWithString:(NSString *) dateString;
+ (NSDate *) convertNSDateWithString:(NSString *) dateString DateFormat:(NSString *)dateFormat;

#pragma mark - md5加密
///md5加密
+ (NSString *) md5:(NSString *) input;

#pragma mark - url编码
///url编码
+ (NSString *)URLEncodedString:(NSString *)str;

/**
 Base64加密
 */
+ (NSString *)base64StringFromText:(NSString *)text;

/**
 Base64解密
 */
+ (NSString *)textFromBase64String:(NSString *)base64;

@end
