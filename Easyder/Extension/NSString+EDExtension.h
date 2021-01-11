//
//  NSString+PinYin.h
//  TableViewIndexTest
//
//  Created by Shadow on 14-3-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (EDPinYin)

/*
 *获取汉字拼音的首字母, 返回的字母是大写形式, 例如: @"俺妹", 返回 @"A".
 *如果字符串开头不是汉字, 而是字母, 则直接返回该字母, 例如: @"b彩票", 返回 @"B".
 *如果字符串开头不是汉字和字母, 则直接返回 @"#", 例如: @"&哈哈", 返回 @"#".
 *字符串开头有特殊字符(空格,换行)不影响判定, 例如@"       a啦啦啦", 返回 @"A".
 */
- (NSString *)firstLetter;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface NSString (EDPredicate)

/**
 * 验证是否有效的手机号
 */
- (BOOL)isValidMobileNumber;

/**
 * 验证是否有效的邮箱
 */
- (BOOL)isValidEmail;

/**
 * 验证是否纯中文
 */
- (BOOL)isOnlyChinese;

/**
 * 验证是否纯英文
 */
- (BOOL)isOnlyEnglish;

/**
 * 验证是否纯数字
 */
- (BOOL)isOnlyNumber;

/**
 * 验证是否数字和小数点
 */
- (BOOL)isOnlyNumberAndDecimal;

/**
 * 验证是否有效的银行卡号
 */
- (BOOL)isValidBankCardNumber;

/**
 * 验证是否有效的字母数字密码
 */
- (BOOL)isValidAlphaNumberPassword;

/**
 * 验证有效身份证（15位）
 */
- (BOOL)isValidIdentifyFifteen;

/**
 * 验证有效身份证（18位）
 */
- (BOOL)isValidIdentifyEighteen;

@end

///***************************************************************************************//
///*****************************************分割线*****************************************//
///***************************************************************************************//

@interface NSString (EDUtils)

/**
 * 电话号码中间4位****显示
 */
- (NSString*)secrectStringWithPhoneNumber;

/**
 * 银行卡号中间8位显示
 */
- (NSString*)secrectStringWithBankCardNo:(NSString*)bankCardNo;

/**
 * 去掉前后空格
 */
- (NSString*)trimmedString;

/**
 * 计算宽度
 */
- (CGFloat)widthWithFontSize:(NSInteger)fontSize height:(CGFloat)height;

/**
 * 计算高度
 */
- (CGFloat)heightWithFontSize:(NSInteger)fontSize width:(CGFloat)width;

/**
 * 计算宽度
 */
- (CGFloat)widthWithFont:(UIFont*)font height:(CGFloat)height;

/**
 * 计算高度
 */
- (CGFloat)heightWithFont:(UIFont*)font width:(CGFloat)width;

/**
 * 获取UUID
 */
+ (NSString *)UUID;

@end

