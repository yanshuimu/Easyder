//
//  EDBaseUtil.m
//  PowerRamp
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 mac. All rights reserved.
//

#import "EDBaseUtil.h"
#import <sys/utsname.h>

@implementation EDBaseUtil

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert alpha:(CGFloat)alpha{
    
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (void)configRefreshWithScrollView:(UIScrollView*)scrollView hasMoreData:(BOOL)hasMoreData hasError:(BOOL)hasError {
    
    if (hasError) {
        [scrollView.mj_header endRefreshing];
        [scrollView.mj_footer endRefreshing];
    } else {
        if (hasMoreData) {
            scrollView.mj_footer.hidden = NO;
            [scrollView.mj_footer resetNoMoreData];
            [scrollView.mj_header endRefreshing];
        } else {
            
            [scrollView.mj_footer endRefreshingWithNoMoreData];
            [scrollView.mj_header endRefreshing];
        }
    }
}

+ (NSString*)createFormatHtmlStringWithString:(NSString*)string width:(CGFloat)width {
    
    NSString *temp = [NSString stringWithFormat:@"<!DOCTYPE html>\n"
    "<html>\n"
    "<head>\n"
    "<meta name=\"viewport\" content=\"width=%f, initial-scale=1 user-scalable=no\">\n"
    "<style>\n"
    "body{color: #939292;}\n"
    "</style>\n"
    "</head>\n"
    "<body>\n"
    "%@\n"
    "%@\n"
    "</body style=\"word-break: break-all;\">\n"
    "<script type='text/javascript'>\n"
    "window.onload = function(){\n"
    "var $img = document.getElementsByTagName('img');\n"
    "for(var p in  $img){\n"
    "$img[p].style.width = '100%%';\n"
    "$img[p].style.height ='auto'\n"
    "}\n"
    "}\n"
    "</script>\n"
    "</html>", width, string, @""];
    
    return temp;
}

+ (void)makePhoneCall:(NSString*)tel {
    
    tel = [tel stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *urlStr = [NSString stringWithFormat:@"telprompt://%@",tel];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}

/**
 * 手机号码隐藏
 */
+ (NSString*)safePhoneNumber:(NSString*)phoneNumber
{
    if (phoneNumber.length < 5) {
        return phoneNumber;
    }
    NSInteger count = phoneNumber.length - 4;//隐藏4位
    if (count % 2 == 0) {//偶数
        NSString *prefix = [phoneNumber substringToIndex:count/2];
        NSString *suffix = [phoneNumber substringFromIndex:phoneNumber.length-count/2];
        return [NSString stringWithFormat:@"%@****%@",prefix,suffix];
    }
    else {//奇数
        NSString *prefix = [phoneNumber substringToIndex:(count-1)/2];
        NSString *suffix = [phoneNumber substringFromIndex:phoneNumber.length-(count-1)/2-1];
        return [NSString stringWithFormat:@"%@****%@",prefix,suffix];
    }
}

//获取ios设备号
+ (NSString *)getDeviceModel {

    //需要导入头文件：#import <sys/utsname.h>
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceString isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([deviceString isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";

    if ([deviceString isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([deviceString isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([deviceString isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";

    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";

    if ([deviceString isEqualToString:@"iPad1,1"]){
        return @"iPad";
    }
    if ([deviceString isEqualToString:@"iPad1,2"]){
        return @"iPad 3G";
    }
    if ([deviceString isEqualToString:@"iPad2,1"]){
        return @"iPad 2 (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad2,2"]){
        return @"iPad 2";
    }
    if ([deviceString isEqualToString:@"iPad2,3"]){
        return @"iPad 2 (CDMA)";
    }
    if ([deviceString isEqualToString:@"iPad2,4"]){
        return @"iPad 2";
    }
    if ([deviceString isEqualToString:@"iPad2,5"]){
        return @"iPad Mini (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad2,6"]){
        return @"iPad Mini";
    }
    if ([deviceString isEqualToString:@"iPad2,7"]){
        return @"iPad Mini (GSM+CDMA)";
    }
    if ([deviceString isEqualToString:@"iPad3,1"]){
        return @"iPad 3 (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad3,2"]){
        return @"iPad 3 (GSM+CDMA)";
    }
    if ([deviceString isEqualToString:@"iPad3,3"]){
        return @"iPad 3";
    }
    if ([deviceString isEqualToString:@"iPad3,4"]){
        return @"iPad 4 (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad3,5"]){
        return @"iPad 4";
    }
    if ([deviceString isEqualToString:@"iPad3,6"]){
        return @"iPad 4 (GSM+CDMA)";
    }
    if ([deviceString isEqualToString:@"iPad4,1"]){
        return @"iPad Air (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad4,2"]){
        return @"iPad Air (Cellular)";
    }
    if ([deviceString isEqualToString:@"iPad4,4"]){
        return @"iPad Mini 2 (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad4,5"]){
        return @"iPad Mini 2 (Cellular)";
    }
    if ([deviceString isEqualToString:@"iPad4,6"]){
        return @"iPad Mini 2";
    }
    if ([deviceString isEqualToString:@"iPad4,7"]){
        return @"iPad Mini 3";
    }
    if ([deviceString isEqualToString:@"iPad4,8"]){
        return @"iPad Mini 3";
    }
    if ([deviceString isEqualToString:@"iPad4,9"]){
        return @"iPad Mini 3";
    }
    if ([deviceString isEqualToString:@"iPad5,1"]){
        return @"iPad Mini 4 (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad5,2"]){
        return @"iPad Mini 4 (LTE)";
    }
    if ([deviceString isEqualToString:@"iPad5,3"]){
        return @"iPad Air 2";
    }
    if ([deviceString isEqualToString:@"iPad5,4"]){
        return @"iPad Air 2";
    }
    if ([deviceString isEqualToString:@"iPad6,3"]){
        return @"iPad Pro 9.7";
    }
    if ([deviceString isEqualToString:@"iPad6,4"]){
        return @"iPad Pro 9.7";
    }
    if ([deviceString isEqualToString:@"iPad6,7"]){
        return @"iPad Pro 12.9";
    }
    if ([deviceString isEqualToString:@"iPad6,8"]){
        return @"iPad Pro 12.9";
    }
    if ([deviceString isEqualToString:@"iPad6,11"]){
        return @"iPad 5 (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad6,12"]){
        return @"iPad 5 (Cellular)";
    }
    if ([deviceString isEqualToString:@"iPad7,1"]){
        return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad7,2"]){
        return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    }
    if ([deviceString isEqualToString:@"iPad7,3"]){
        return @"iPad Pro 10.5 inch (WiFi)";
    }
    if ([deviceString isEqualToString:@"iPad7,4"]){
        return @"iPad Pro 10.5 inch (Cellular)";
    }

    if ([deviceString isEqualToString:@"AppleTV2,1"])    return @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])    return @"Apple TV 4";

    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";

    return deviceString;
}

/**
 * 保存设备唯一标志
 */
+ (void)saveDeviceUUID
{
    /*
    NSDictionary *dict = [EDKeyChain load:KEY_DEVICE_UUID];
    if (kDictIsEmpty(dict))
    {
        //生成UUID
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        NSString *uuid = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [EDKeyChain saveObjectData:@{@"uuid": uuid} keyService:KEY_DEVICE_UUID];
    }
     */
}

/**
 * 获取设备唯一标志
 */
+ (NSString*)loadDeviceUUID
{
    /*
    NSDictionary *dict = [EDKeyChain load:KEY_DEVICE_UUID];
    if (!kDictIsEmpty(dict))
    {
        return dict[@"uuid"];
    }
     */
    return @"";
}

+ (void)copyToPasteboard:(NSString*)content
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = content;
}

@end
