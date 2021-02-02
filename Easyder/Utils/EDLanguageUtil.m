//
//  EDLanguageUtil.m
//  PowerRamp
//
//  Created by apple on 2020/6/14.
//  Copyright © 2020 xuhonggui. All rights reserved.
//

#import "EDLanguageUtil.h"

@implementation EDLanguageUtil

+ (void)setDefaultLanguageChinese
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *localFileName = [defaults objectForKey:LocalLanguageFileKey];
    if (!localFileName) {
        //简体中文
        [defaults setObject:LocalLanguageChineseFileName forKey:LocalLanguageFileKey];
        [defaults synchronize];
    }
}

+ (void)setDefaultLanguageEnglish
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *localFileName = [defaults objectForKey:LocalLanguageFileKey];
    if (!localFileName) {
        [defaults setObject:LocalLanguageEnglishFileName forKey:LocalLanguageFileKey];
        [defaults synchronize];
    }
}

/**
 * 本机现在用的语言
 * en:英文  zh-Hans:简体中文   zh-Hant:繁体中文    ja:日本  ......
 */
+ (NSString*)getPreferredLanguage
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString* preferredLang = [languages objectAtIndex:0];
    NSLog(@"Preferred Language:%@", preferredLang);
    return preferredLang;
}

+ (BOOL)isLocalizableLanguageTypeChinese {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *language = [userDefaults valueForKey:LocalLanguageFileKey];
    
    return [language isEqualToString:LocalLanguageChineseFileName];
}

+ (void)convertLocalizableLanguageToChinese {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:LocalLanguageChineseFileName forKey:LocalLanguageFileKey];
    [defaults synchronize];
    
}

+ (void)convertLocalizableLanguageToEnglish {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:LocalLanguageEnglishFileName forKey:LocalLanguageFileKey];
    [userDefaults synchronize];
    
}

@end
