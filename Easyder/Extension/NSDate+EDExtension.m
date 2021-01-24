//
//  NSDate+Extension.m
//  DYLRopeSkipping
//
//  Created by mac on 2017/8/23.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "NSDate+EDExtension.h"

@implementation NSDate (EDUtils)

+ (NSString*)currentTimestamp {
    
    NSDate *date = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", ((long)interval * 1000)];
}

+ (NSString*)stringWithFormat:(NSString*)format {
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSString *systemTime = [dateFormatter stringFromDate:date];
    
    return systemTime;
}

+ (NSString*)stringWithDate:(NSDate*)date format:(NSString*)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:date];
}

+ (NSString*)stringWithTimestamp:(NSString*)timestamp format:(NSString*)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.integerValue];
    return [dateFormatter stringFromDate:date];
}

+ (NSString*)stringChangeFormat:(NSString*)dateString fromFormat:(NSString*)fromFormat toFormat:(NSString*)toFormat
{
    NSDate *date = [self dateWithString:dateString format:fromFormat];
    return [self stringWithDate:date format:toFormat];
}

+ (NSDate*)dateWithString:(NSString*)dateString format:(NSString*)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter dateFromString:dateString];
}

+ (NSString*)timeFromSeconds:(NSInteger)seconds {
        
    NSString *hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    NSString *minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    NSString *second = [NSString stringWithFormat:@"%02ld",seconds%60];
    NSString *time = [NSString stringWithFormat:@"%@:%@:%@", hour, minute, second];
    return time;
}

+ (NSDate*)prevOrNextDateWithDays:(double)days fromDate:(NSDate*)fromDate {
    
    NSTimeInterval timeInterval = days * 24.0 * 60.0 * 60.0;
    NSDate *date = [fromDate initWithTimeInterval:timeInterval sinceDate:fromDate];
    return date;
}

@end
