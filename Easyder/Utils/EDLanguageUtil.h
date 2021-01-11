//
//  EDLanguageUtil.h
//  PowerRamp
//
//  Created by apple on 2020/6/14.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define LocalLanguageKey @"localLanguageKey"
#define LocalLanguageFileKey @"localFileName"
#define LocalLanguageChineseFileName @"Localization_chinese" //文件命名：Localization_chinese.strings
#define LocalLanguageEnglishFileName @"Localization_english" //文件命名：Localization_english.strings

#define LanguageFileName [[NSUserDefaults standardUserDefaults] objectForKey:LocalLanguageFileKey]
//国际化字符串
#define LocalizedString(string) NSLocalizedStringFromTable(string, LanguageFileName, nil)
//当前国际化是否中文模式
#define kLocalizationChinese [EDLanguageUtil isLocalizableLanguageTypeChinese]

@interface EDLanguageUtil : NSObject

/**
 * 设置默认语言为简体中文
 */
+ (void)setDefaultLanguageChinese;

/**
 * 设置默认语言为英语
 */
+ (void)setDefaultLanguageEnglish;

/**
 * 获取手机当前语言
 */
+ (NSString*)getPreferredLanguage;

/**
 * 当前国际化是否中文模式
 */
+ (BOOL)isLocalizableLanguageTypeChinese;

/**
 * 切换语言至中文模式
 */
+ (void)convertLocalizableLanguageToChinese;

/**
 * 切换语言至英文模式
 */
+ (void)convertLocalizableLanguageToEnglish;

@end

NS_ASSUME_NONNULL_END
