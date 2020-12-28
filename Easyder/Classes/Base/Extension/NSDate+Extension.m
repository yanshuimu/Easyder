//
//  NSDate+Extension.m
//  DYLRopeSkipping
//
//  Created by mac on 2017/8/23.
//  Copyright © 2017年 DLC. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString*)getCurrentTimestamp
{
    NSDate *date = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", ((long)interval * 1000)];
}

+ (NSString*)getCurrentDateWithFormatter:(NSString*)formatter
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    
    NSString *systemTime = [dateFormatter stringFromDate:date];
    
    return systemTime;
}


+ (NSString*)changeDateFormatter:(NSString*)oldFormatter
                    newFormatter:(NSString*)newFormatter
                      dateString:(NSString*)dateString
{
    NSString *tempDateStr = dateString;
    NSDateFormatter *tempFormatter = [[NSDateFormatter alloc] init];
    tempFormatter.dateFormat = oldFormatter;
    NSDate *date = [tempFormatter dateFromString:tempDateStr];
    tempFormatter.dateFormat = newFormatter;
    NSString *newDateStr = [tempFormatter stringFromDate:date];
    
    return newDateStr;
}

+ (NSString*)dateStringWithTimestamp:(NSString*)timestamp formatter:(NSString*)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.integerValue];
    return [dateFormatter stringFromDate:date];
}

//传入 秒  得到 xx:xx:xx
+ (NSString*)getHHMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}



+ (NSDate*)dateWithDateString:(NSString*)dateString formatter:(NSString*)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter dateFromString:dateString];
}

+ (NSString*)stringWithDate:(NSDate*)date formatter:(NSString*)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter stringFromDate:date];
}

@end
