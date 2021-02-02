//
//  NSDate+Extension.h
//  DYLRopeSkipping
//
//  Created by xuhonggui on 2017/8/23.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (EDUtils)

/**
 *  当前时间戳
 */
+ (NSString*)currentTimestamp;

/**
 *  当前日期
 */
+ (NSString*)stringWithFormat:(NSString*)format;

/**
 * NSDate转NSString
 */
+ (NSString*)stringWithDate:(NSDate*)date format:(NSString*)format;

/**
 *  timestamp转String
 */
+ (NSString*)stringWithTimestamp:(NSString*)timestamp format:(NSString*)format;

/**
 *  fromFormat转toFormat格式
 */
+ (NSString*)stringChangeFormat:(NSString*)dateString fromFormat:(NSString*)fromFormat toFormat:(NSString*)toFormat;

/**
 *  String转NSDate
 */
+ (NSDate*)dateWithString:(NSString*)dateString format:(NSString*)format;

/**
 * 秒数生成HH:mm:ss格式字符串
 */
+ (NSString*)timeFromSeconds:(NSInteger)seconds;

/**
 * 从某个日期往前或往后N天
 */
+ (NSDate*)prevOrNextDateWithDays:(double)days fromDate:(NSDate*)fromDate;

@end
