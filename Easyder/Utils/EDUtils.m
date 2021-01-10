//
//  DLCTools.m
//  MusiciansAndMuslns
//
//  Created by huabing jiang on 2017/5/24.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import "EDUtils.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <MJRefresh/MJRefresh.h>

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

/* Base64加密表 */
static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation EDUtils

+ (UIColor*)colorWithHexString:(NSString*)hexString alpha:(CGFloat)alpha {
    
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
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

//判断是否是手机号码
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    if(mobile.length != 11){
        return NO;
    }
    NSString *mobileRegex = @"^1(3|4|5|6|7|8|9)\\d{9}$";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobileRegex];
    return [mobileTest evaluateWithObject:mobile];
}
//判断是否是邮箱
+(BOOL)isValidateEmail:(NSString*)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)isValidateEnglish:(NSString*)str{
    NSString *emailRegex = @"[A-Za-z]";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:str];
}
+ (BOOL)isInputRuleAndBlank:(NSString *)str {
    
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d\\s]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}
//判断是否是座机
+(BOOL)isValidateTel:(NSString*)tel{
    NSString *TelRegex = @"\\d{3}-\\d{8}|\\d{4}-\\d{7,8}|\\d{11}|\\d{12}";
    NSPredicate *TelTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", TelRegex];
    return [TelTest evaluateWithObject:tel];
}

+(BOOL)validateMoney:(NSString *)money{
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{1,2})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:money];
}

//去掉空格后的长度
+(NSInteger)noSpaceslength:(NSString*)string{
    NSString *str = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str.length;
}

//图片等比例缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

//隐藏手机号中间4位
+(NSString*)mobileWithAsterisk:(NSString*)mobile
{
    if ([mobile length] != 11) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@****%@",[mobile substringToIndex:3],[mobile substringWithRange:NSMakeRange([mobile length]-4, 4)]];
}

//隐藏座机中间4位
+(NSString*)telWithAsterisk:(NSString*)tel
{
    if (![self isValidateTel:tel]) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@****%@",[tel substringToIndex:tel.length-6],[tel substringWithRange:NSMakeRange([tel length]-2, 2)]];
}


#pragma mark -- 字体之间颜色变换
+ (NSMutableAttributedString *)attributeColorStringArr:(NSArray *)strArr color1HexStringArr:(NSArray *)colorArr{
    NSString *string = [self arrayToString:strArr dotString:@""];
    NSMutableAttributedString *testStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger strLength = 0;
    for (int i = 0 ; i < strArr.count; i++) {
        [testStr addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:colorArr[i] alpha:1.0] range:NSMakeRange(strLength,[strArr[i] length])];
        strLength = [strArr[i] length] + strLength;
    }
    return testStr;
}

+ (NSMutableAttributedString *)attributeColorStringArr:(NSArray *)strArr colorArr:(NSArray *)colorArr{
    NSString *string = [self arrayToString:strArr dotString:@""];
    NSMutableAttributedString *testStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger strLength = 0;
    for (int i = 0 ; i < strArr.count; i++) {
        [testStr addAttribute:NSForegroundColorAttributeName value:colorArr[i] range:NSMakeRange(strLength,[strArr[i] length])];
        strLength = [strArr[i] length] + strLength;
    }
    return testStr;
}

+ (NSMutableAttributedString *)attributeString:(NSString*)str leftFont:(NSInteger)leftfont rightFont:(NSInteger)rightfont{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange leftRange = [str rangeOfString:@"£"];
    if(leftRange.length>0){
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:leftfont] range:NSMakeRange(leftRange.location,leftRange.length)];
    }
    NSRange rightRange = [str rangeOfString:@"."];
    if(rightRange.length>0){
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:rightfont] range:NSMakeRange(rightRange.location,str.length-rightRange.location)];
    }
    return attrString;
}


// 文字大小做了处理
+ (NSMutableAttributedString *)attributeFontStringArr:(NSArray *)strArr fontArr:(NSArray *)fontArr{
    NSString *str = @"";
    
    for (int i = 0; i < strArr.count; i++) {
        str = [str stringByAppendingString:strArr[i]];
    }
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    NSInteger textIndex = 0;
    for (int i = 0; i < strArr.count; i++) {
        NSLog(@"---%@",strArr[i]);
        [attrString addAttribute:NSFontAttributeName value:[self fontWithDevice:[fontArr[i] floatValue]] range:NSMakeRange(textIndex,[strArr[i] length])];
        textIndex = textIndex+ [strArr[i] length];
    }

    return attrString;
}
// 自定义文字大小
+ (NSMutableAttributedString *)attributeCoustomFontStringArr:(NSArray *)strArr CustomFontArr:(NSArray *)fontArr{
    NSString *str = @"";
    
    for (int i = 0; i < strArr.count; i++) {
        str = [str stringByAppendingString:strArr[i]];
    }
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    NSInteger textIndex = 0;
    for (int i = 0; i < strArr.count; i++) {
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:[fontArr[i] floatValue]] range:NSMakeRange(textIndex,[strArr[i] length])];
        textIndex = textIndex+[strArr[i] length];
    }
    
    return attrString;
}

+ (NSMutableAttributedString *)attributeFontStringArray:(NSArray *)stringArray fontArray:(NSArray *)fontArray {
    
    NSString *string = @"";
    for (int i = 0; i < stringArray.count; i++) {
        string = [string stringByAppendingString:stringArray[i]];
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger textIndex = 0;
    for (int i = 0; i < stringArray.count; i++) {
        [attributedString addAttribute:NSFontAttributeName value:fontArray[i] range:NSMakeRange(textIndex, [stringArray[i] length])];
        textIndex = textIndex + [stringArray[i] length];
    }
    
    return attributedString;
}

#pragma 字体上下间距
+ (NSMutableAttributedString *)attributedLineSpacing:(NSString *)titleStr spacing:(NSInteger)spacingInt{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:titleStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacingInt];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [titleStr length])];

    return attributedString;
}

-(NSMutableAttributedString*) changeLabelWithText:(NSString*)needText
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    UIFont *font = [UIFont systemFontOfSize:16];
    [attrString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0,2)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:NSMakeRange(4,needText.length-4)];
    
    return attrString;
}

+ (NSString *)arrayToString:(NSArray *)arr dotString:(NSString *)dot{
    NSString *string = [arr componentsJoinedByString:dot];
    return string;
}

#pragma mark -- 时间字符串转时间戳
+(NSTimeInterval)timestampFromDateStr:(NSString *)dataStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // HH是24进制，hh是12进制
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 返回的格林治时间
    NSDate *date = [formatter dateFromString:dataStr];
    NSTimeInterval timestamp = [date timeIntervalSince1970];
    return timestamp;
}

+ (NSString *)serviceTimesTampToStr:(NSString *)timeTampStr{
    
    // 系统时间戳
    float sysTimeFloat = [[NSDate date] timeIntervalSince1970];
    NSLog(@"---%.0f",sysTimeFloat);
    // 时间戳互减
    float timeFloat =sysTimeFloat -[timeTampStr floatValue];
    
    
    if (timeFloat < 60) {
        // 1分钟内
        return @"刚刚";
    }else if (timeFloat > 60 && timeFloat < 3600){
        // 60分钟内
        return [NSString stringWithFormat:@"%.0f分钟前",timeFloat/60];
    }
    
    NSString *serviceTime = [self dateStrFromTimestamp:timeTampStr Accuracy:OnlyDate];
    NSString *sysTime = [self dateStrFromTimestamp:[NSString stringWithFormat:@"%.0f",sysTimeFloat] Accuracy:OnlyDate];
    
    if ([serviceTime isEqualToString:sysTime]) {
        // 当日
        return [self dateStrFromTimestamp:timeTampStr Accuracy:OnlyTime];
    }
    // 年月日时分
    return [self dateStrFromTimestamp:timeTampStr Accuracy:HasMinutes];
    

}

#pragma mark -- 时间戳转时间字符串
+(NSString*)dateStrFromTimestamp:(NSString*)timestamp Accuracy:(TimeAccuracy)timeAccuracy{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestamp intValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    switch (timeAccuracy) {
        case 0:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case 1:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH"];
            break;
        case 2:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        case 3:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        case 4:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case 5:
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            break;
        default:
            break;
    }
    return [dateFormatter stringFromDate:confromTimesp];
}



+(BOOL)isNickName:(NSString*)nickname{
    
    
    
    
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:nickname];
}

//判断是否为整形：
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：
+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

+ (NSString*)dealwithPrice:(NSString*)price{
    
    NSRange range = [price rangeOfString:@"."];
    if (range.length==0) {
        return price;
    }
    if (price.length>range.location+range.length+2) {
        price = [price substringWithRange:NSMakeRange(0, range.location+range.length+2)];
    }
    
    for (NSInteger i = price.length-1; i>0; i--) {
        NSString *s = [price substringWithRange:NSMakeRange(i, 1)];
        if ([s isEqualToString:@"."]) {
            price = [price substringWithRange:NSMakeRange(0, i)];
            break;
        }
        else if ([s intValue]==0){
            price = [price substringWithRange:NSMakeRange(0, i)];
        }
        else{
            break;
        }
    }
    return price;
}



#pragma mark -- 判断是否有中文
+ (BOOL)IsChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

//去掉emoji表情
+ (NSString *)disable_emoji:(NSString *)text
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}

//去掉html标签
+(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        [scanner scanUpToString:@"<" intoString:nil];
        [scanner scanUpToString:@">" intoString:&text];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return html;
}


+(UIColor*)colorWithType:(NSString*)type{
    NSString *color;
    switch ([type intValue]) {
        case 1:  //新建
            color = @"#569cd3";
            break;
        case 2:  //业扩
            color = @"#39cc79";
            break;
        case 3:  //试验
            color = @"#ad77b0";
            break;
        case 4:  //代维
            color = @"#00aea8";
            break;
        case 5:  //抢修
            color = @"#eb7a35";
            break;
        case 6:  //其他
            color = @"#aaaaaa";
            break;
        default:
            break;
    }
    
    return [self colorWithHexString:color alpha:1.0];
}

//排除系统九宫格输入
+ (BOOL)isContainEmoji:(NSString *)string{
    NSArray *arr = @[@"➋",@"➌",@"➍",@"➎",@"➏",@"➐",@"➑",@"➒"];
    if ([arr containsObject:string]) {
        return NO;
    }
    return [self stringContainsEmoji:string];
}

// 判断是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

+(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;

}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return array;
}


//[self toArrayOrNSDictionary:[@"" dataUsingEncoding:NSUTF8StringEncoding]];
// 将JSON串转化为字典或者数组  数组转换字符串
+ (id)toArrayOrNSDictionary:(NSData *)jsonData{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingMutableContainers
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
    
}

//[[NSString alloc] initWithData:[self toJSONData:dic[@""]] encoding:NSUTF8StringEncoding];
// 将字典或者数组转化为JSON串
+ (NSData *)toJSONData:(id)theData{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSLog(@"%@", jsonData);
    
    if ([jsonData length] != 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
}

//给HTML加上图片自适应屏幕宽度和文字适配屏幕换行
+(NSString*)importHtmlHead:(NSString*)html{
    NSString *htmlBefore = @"";
    NSString *htmlAfter = @"";
    NSRange htmlRange = [html rangeOfString:@"<html"];
    if (htmlRange.length>0) {
        NSRange range = [[html substringFromIndex:htmlRange.location] rangeOfString:@">"];
        htmlBefore = [html substringToIndex:htmlRange.location+range.location+range.length];
        htmlAfter = @"</html>";
        htmlRange = [html rangeOfString:@"</html>"];
        html = [html substringWithRange:NSMakeRange(htmlBefore.length, htmlRange.location-htmlBefore.length)];
    }
    
    NSRange headRange = [html rangeOfString:@"<head>"];
    if (headRange.length>0) {
        html = [NSString stringWithFormat:@"%@<style>img{width:%.fpx !important;}</style>%@",[html substringToIndex:headRange.location+headRange.length],SCREEN_W-30,[html substringFromIndex:headRange.location+headRange.length]];
    }
    else{
        html = [NSString stringWithFormat:@"<head><style>img{max-width:%.fpx !important;}</style></head>%@",SCREEN_W-30,html];
    }
    headRange = [html rangeOfString:@"</head>"];
    htmlBefore = [htmlBefore stringByAppendingString:[html substringToIndex:headRange.location+headRange.length]];
    
    html = [html substringFromIndex:headRange.location+headRange.length];
    
    NSRange bodyRange = [html rangeOfString:@"<body"];
    if (bodyRange.length>0) {
        NSRange range = [[html substringFromIndex:bodyRange.location] rangeOfString:@">"];
        html = [NSString stringWithFormat:@"<body width=%.fpx style=/\"word-wrap:break-word; font-family:Arial; text-align:center;/\">%@",SCREEN_W-20,[html substringFromIndex:bodyRange.location+range.location+range.length]];
    }
    else{
        html = [NSString stringWithFormat:@"<body width=%.fpx style=/\"word-wrap:break-word; font-family:Arial; text-align:center;/\">%@</body>",SCREEN_W-20,html];
    }
    
    html = [NSString stringWithFormat:@"%@%@%@",htmlBefore,html,htmlAfter];
    
    return html;
}

+(NSString*)emptyhtml{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"details_describe_empty" withExtension:@"png"];
    return [NSString stringWithFormat:@"<html><body><style>body{background-color:#f4f4f4}</style><div id=\"box\"><table width=\"100%%\" height=\"70%%\"><tr><td align=\"center\"><img src=\"%@\" width=\"143\" height=\"164\" /><p class=\"text\" style=\"font-size:36px;color:#999999;text-align:center;\">暂时还没有详情哦</p></td></tr></table></div></body></html>",url];
}

+ (NSAttributedString *)attribteLabelLineSpacing:(NSString *)str font:(NSInteger)fontInt lineSpacInt:(NSInteger)lineSpacInt{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode =NSLineBreakByCharWrapping;
    paraStyle.alignment =NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacInt; //设置行间距
    
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic =@{NSFontAttributeName:[UIFont systemFontOfSize:fontInt],NSParagraphStyleAttributeName:paraStyle,NSKernAttributeName:@0.f};
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    return attributeStr;
}


//生成二维码图片
+ (UIImage*)createQrImage:(NSString*)string{
    // 1. 实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2. 恢复滤镜的默认属性
    [filter setDefaults];
    // 3. 将字符串转换成
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 4. 通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    // 5. 获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 6. 生成高清二维码
    CGRect extentRect = CGRectIntegral(outputImage.extent);
    CGFloat scale = MIN(500 / CGRectGetWidth(extentRect), 500 / CGRectGetHeight(extentRect));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extentRect) * scale;
    size_t height = CGRectGetHeight(extentRect) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:outputImage fromRect:extentRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extentRect, bitmapImage);
    
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage]; // 黑白图片
}

+(UIImage*)getGrayImage:(UIImage*)sourceImage
{
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    
    return grayImage;
}

// 给label加横线
+ (void)priceAddLine:(UILabel *)priceL lineColor:(NSString *)colorStr{
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, priceL.frame.size.height/2, priceL.frame.size.width, 0.7)];
    line.backgroundColor = [self colorWithHexString:colorStr alpha:1.0];
    [priceL addSubview:line];
}


+ (UILabel *)contentLabel:(NSString *)str lineSpacInt:(NSInteger)spacInt fontSize:(NSInteger)fontSize frame:(CGRect)frame cgsize:(CGSize)cgSize{
    NSInteger fontSize1=13;
    if (SCREEN_W > 375) {
        fontSize1 = fontSize + 1;
    }else if (SCREEN_W == 375){
        fontSize1 = fontSize ;
    }else if (SCREEN_W == 320){
        fontSize1 = fontSize-1;
    }
    CGSize size = [self multiLineTextFontSize:str fontSize:fontSize1 maxSize:cgSize];
    NSInteger count = (size.height/fontSize1)-1;
    frame.size.height = size.height+count*spacInt;
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    
    label.textColor = [self colorWithHexString:@"#747474" alpha:1.0];
    label.font = [UIFont systemFontOfSize:fontSize1];
    label.attributedText = [self attribteLabelLineSpacing:str font:fontSize1 lineSpacInt:spacInt];
    label.numberOfLines = 0;
    
    
    return label;
    
    
}

//view 按比例缩放
+(void)viewTransform:(UIView*)view proportion:(float)p
{
    if (p == 1.0) {
        return;
    }
    CGAffineTransform newTransform =
    CGAffineTransformScale(view.transform, p, p);
    [view setTransform:newTransform];
    view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
}

+ (void) shakeToShow:(UIView*)aView Block:(void(^)())block
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];

    animation.values = @[@(1.0),@(0.95),@(1.0)];
    animation.keyTimes = @[@(0.0),@(0.8),@(1.0)];
    animation.calculationMode = kCAAnimationLinear;

    [aView.layer addAnimation:animation forKey:@"SHOW"];

    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        block();
    });

}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace Alignment:(NSTextAlignment)alignment{
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [paragraphStyle setAlignment:alignment];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
}

+ (NSAttributedString *)attribteLabelInsertImage:(NSString *)imgStr labelStr:(NSString *)labelStr insertInt:(NSInteger)insertInt cgRect:(CGRect)frame{
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:imgStr];
    // 设置图片大小
    attch.bounds = frame;

    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:labelStr];
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attri insertAttributedString:string atIndex:insertInt];
    
    return attri;
}

+ (void)drawBorderLine:(UIView *)drawView lineColoStr:(NSString *)lineColor{
    CAShapeLayer *border = [CAShapeLayer layer];
    
    border.strokeColor = [self colorWithHexString:lineColor alpha:1.0].CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRect:drawView.bounds].CGPath;
    
    border.frame = drawView.bounds;
    
    border.lineWidth = 1.f;
    
    border.lineCap = @"square";
    
    border.lineDashPattern = @[@4, @3];
    
    [drawView.layer addSublayer:border];
}

//加阴影
+(void)Shadow:(CALayer *)layer width:(CGFloat)width height:(CGFloat)height Radius:(CGFloat)Radius Opacity:(CGFloat)Opacity color:(NSString *)color{
    
    layer.shadowOffset = CGSizeMake(width, height);  // 阴影的范围
    layer.shadowOpacity = Opacity;  // 阴影透明度
    layer.shadowRadius = Radius;   // 阴影扩散的范围控制
    layer.shadowColor = [self colorWithHexString:color alpha:1.0].CGColor;  // 阴影的颜色
    
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

+ (void)configRefreshWithScrollView:(UIScrollView*)scrollView hasMoreData:(BOOL)hasMoreData hasError:(BOOL)hasError {
    
    if (hasError) {
        
        [scrollView.mj_header endRefreshing];
        [scrollView.mj_footer endRefreshing];
    }
    else {
        
        if (hasMoreData) {
            
            scrollView.mj_footer.hidden = NO;
            [scrollView.mj_footer resetNoMoreData];
            [scrollView.mj_header endRefreshing];
        }
        else {
            
            scrollView.mj_footer.hidden = YES;
            [scrollView.mj_footer endRefreshingWithNoMoreData];
            [scrollView.mj_header endRefreshing];
        }
    }
}

+ (NSString*)firstImageUrlFromUrlComponents:(NSString*)urlComponents {
    
    NSString *url = @"";
    if (![self stringIsEmpty:urlComponents])
    {
        url = [[[self safeString:urlComponents] componentsSeparatedByString:@";"] firstObject];
    }
    return url;
}

+ (UIFont *)fontWithDevice:(CGFloat)fontSize {
    if (SCREEN_W > 1024) {
        fontSize = fontSize + 1;
    }else {
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

///md5加密
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}


/**
 Base64加密
 */
+ (NSString *)base64StringFromText:(NSString *)text
{
    if (text && ![text isEqualToString:@""]) {
        //取项目的bundleIdentifier作为KEY
        NSString *key = [[NSBundle mainBundle] bundleIdentifier];
        NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
        //IOS 自带DES加密 Begin
        data = [self DESEncrypt:data WithKey:key];
        //IOS 自带DES加密 End
        return [self base64EncodedStringFrom:data];
    }
    else {
        return @"";
    }
}

/**
 Base64解密
 */
+ (NSString *)textFromBase64String:(NSString *)base64
{
    if (base64 && ![base64 isEqualToString:@""]) {
        //取项目的bundleIdentifier作为KEY
        NSString *key = [[NSBundle mainBundle] bundleIdentifier];
        NSData *data = [self dataWithBase64EncodedString:base64];
        //IOS 自带DES解密 Begin
        data = [self DESDecrypt:data WithKey:key];
        //IOS 自带DES加密 End
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    else {
        return @"";
    }
}

/************************************************************
 函数名称 : + (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key
 函数描述 : 文本数据进行DES加密
 输入参数 : (NSData *)data
 (NSString *)key
 输出参数 : N/A
 返回参数 : (NSData *)
 备注信息 : 此函数不可用于过长文本
 **********************************************************/
+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

/************************************************************
 函数名称 : + (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key
 函数描述 : 文本数据进行DES解密
 输入参数 : (NSData *)data
 (NSString *)key
 输出参数 : N/A
 返回参数 : (NSData *)
 备注信息 : 此函数不可用于过长文本
 **********************************************************/
+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer);
    return nil;
}

/************************************************************
 函数名称 : + (NSData *)dataWithBase64EncodedString:(NSString *)string
 函数描述 : base64格式字符串转换为文本数据
 输入参数 : (NSString *)string
 输出参数 : N/A
 返回参数 : (NSData *)
 备注信息 :
 **********************************************************/
+ (NSData *)dataWithBase64EncodedString:(NSString *)string
{
    if (string == nil)
        [NSException raise:NSInvalidArgumentException format:nil];
    if ([string length] == 0)
        return [NSData data];
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL)
    {
        decodingTable = malloc(256);
        if (decodingTable == NULL)
            return nil;
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++)
            decodingTable[(short)encodingTable[i]] = i;
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL)     //  Not an ASCII string!
        return nil;
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (YES)
    {
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++)
        {
            if (characters[i] == '\0')
                break;
            if (isspace(characters[i]) || characters[i] == '=')
                continue;
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
            {
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0)
            break;
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
        {
            free(bytes);
            return nil;
        }
        
        //  Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2)
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        if (bufferLength > 3)
            bytes[length++] = (buffer[2] << 6) | buffer[3];
    }
    
    bytes = realloc(bytes, length);
    return [NSData dataWithBytesNoCopy:bytes length:length];
}

/************************************************************
 函数名称 : + (NSString *)base64EncodedStringFrom:(NSData *)data
 函数描述 : 文本数据转换为base64格式字符串
 输入参数 : (NSData *)data
 输出参数 : N/A
 返回参数 : (NSString *)
 备注信息 :
 **********************************************************/
+ (NSString *)base64EncodedStringFrom:(NSData *)data
{
    if ([data length] == 0)
        return @"";
    
    char *characters = malloc((([data length] + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (i < [data length])
    {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [data length])
            buffer[bufferLength++] = ((char *)[data bytes])[i++];
        
        //  Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = encodingTable[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

+ (BOOL)stringIsEmpty:(NSString*)string {
    return (string && [[NSString stringWithFormat:@"%@", string] length] > 0 ? NO : YES);
}

+ (NSString*)safeString:(NSString*)string {
    return [NSString stringWithFormat:@"%@", string];
}

+ (CGSize)multiLineTextFontSize:(NSString*)text fontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize {
    
    return [text length] > 0 ? [text
    boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin)
    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size : CGSizeZero;
}

+ (UIFont*)fontMake:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont*)boldFontMake:(CGFloat)fontSize {
    return [UIFont boldSystemFontOfSize:fontSize];
}

+ (NSDictionary *)nullDic:(NSDictionary *)myDic
{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++)
    {
        id obj = [myDic objectForKey:keyArr[i]];
        
        obj = [self changeType:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

//将NSArray中的Null类型的项目转化成@""
+ (NSArray *)nullArr:(NSArray *)myArr
{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++)
    {
        id obj = myArr[i];
        
        obj = [self changeType:obj];
        
        [resArr addObject:obj];
    }
    return resArr;
}

//将NSString类型的原路返回
+(NSString *)stringToString:(NSString *)string
{
    return string;
}

//将Null类型的项目转化成@""
+(NSString *)nullToString
{
    return @"";
}

//主要方法
//类型识别:将所有的NSNull类型转化成@""
+ (id)changeType:(id)myObj
{
    if ([myObj isKindOfClass:[NSDictionary class]])
    {
        return [self nullDic:myObj];
    }
    else if([myObj isKindOfClass:[NSArray class]])
    {
        return [self nullArr:myObj];
    }
    else if([myObj isKindOfClass:[NSString class]])
    {
        return [self stringToString:myObj];
    }
    else if([myObj isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    else
    {
        return myObj;
    }
}

@end
