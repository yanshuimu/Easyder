//
//  NSDate+Extension.h
//  DYLRopeSkipping
//
//  Created by mac on 2017/8/23.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (EDUtils)

/**
 *  获取当前时间戳
 */
+ (NSString*)getCurrentTimestamp;

/**
 *  获取当前时间
 */
+ (NSString*)getCurrentDateWithFormatter:(NSString*)formatter;

/**
 *  根据时间戳获取时间
 */
+ (NSString*)dateStringWithTimestamp:(NSString*)timestamp
                           formatter:(NSString*)formatter;

/**
 *  根据日期字符串获取NSDate
 */
+ (NSDate*)dateWithDateString:(NSString*)dateString
                    formatter:(NSString*)formatter;

//传入秒，获取时-分-秒
+ (NSString*)getHHMMSSFromSS:(NSString *)totalTime;

/**
 *  修改时间格式
 */
+ (NSString*)changeDateFormatter:(NSString*)oldFormatter
                    newFormatter:(NSString*)newFormatter
                      dateString:(NSString*)dateString;

/**
 * NSDate转NSString
 */
+ (NSString*)stringWithDate:(NSDate*)date formatter:(NSString*)formatter;

@end
