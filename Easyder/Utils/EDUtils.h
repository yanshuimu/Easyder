//
//  DLCTools.h
//  MusiciansAndMuslns
//
//  Created by huabing jiang on 2017/5/24.
//  Copyright © 2017年 easyder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//时间的精度（年,月,日,时,分,秒）
typedef NS_ENUM(NSInteger, TimeAccuracy) {
    OnlyDate = 0,   //年月日
    HasHour,        //年月日时
    HasMinutes,     //年月日时分
    HasSeconds,     //年月日时分秒
    OnlyTime,       //时分
    TimeSeconds,    //时分秒
};

@interface EDUtils : NSObject

///十六进制color转为UIColor
+ (UIColor*)colorWithHexString:(NSString*)hexString alpha:(CGFloat)alpha;

+ (NSMutableAttributedString *)attributedLineSpacing:(NSString *)titleStr spacing:(NSInteger)spacingInt;
//验证手机
+(BOOL)isValidateMobile:(NSString *)mobile;
+ (BOOL)isInputRuleAndBlank:(NSString *)str;
// 验证是否a-z A-Z
+(BOOL)isValidateEnglish:(NSString*)str;
//验证邮箱
+(BOOL)isValidateEmail:(NSString*)email;
//验证座机
+(BOOL)isValidateTel:(NSString*)tel;
//验证金额
+(BOOL)validateMoney:(NSString *)money;
//去掉空格后的长度
+(NSInteger)noSpaceslength:(NSString*)string;
//图片等比缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
//隐藏手机号中间4位
+(NSString*)mobileWithAsterisk:(NSString*)mobile;
+(NSString*)telWithAsterisk:(NSString*)tel;

+ (NSMutableAttributedString *)attributeColorStringArr:(NSArray *)strArr color1HexStringArr:(NSArray *)colorArr;
+ (NSMutableAttributedString *)attributeColorStringArr:(NSArray *)strArr colorArr:(NSArray *)colorArr;
+ (NSMutableAttributedString *)attributeString:(NSString*)str leftFont:(NSInteger)leftfont rightFont:(NSInteger)rightfont;
+ (NSMutableAttributedString *)attributeFontStringArr:(NSArray *)strArr fontArr:(NSArray *)fontArr;
// 自定义文字大小
+ (NSMutableAttributedString *)attributeCoustomFontStringArr:(NSArray *)strArr CustomFontArr:(NSArray *)fontArr;
/**
 * 富文本-字体
 */
+ (NSMutableAttributedString *)attributeFontStringArray:(NSArray *)stringArray fontArray:(NSArray *)fontArray;

+ (NSString *)serviceTimesTampToStr:(NSString *)timeTampStr;
//时间戳转时间字符串
+(NSString*)dateStrFromTimestamp:(NSString*)timestamp Accuracy:(TimeAccuracy)timeAccuracy;

+(NSTimeInterval)timestampFromDateStr:(NSString *)dataStr;
+(BOOL)isNickName:(NSString*)nickname;


+ (BOOL)isPureInt:(NSString*)string;

+ (BOOL)isPureFloat:(NSString*)string;

//价格处理(去掉后面的0)
+ (NSString*)dealwithPrice:(NSString*)price;

#pragma mark -- 判断是否有中文
+ (BOOL)IsChinese:(NSString *)str;

//去掉emoji表情
+ (NSString *)disable_emoji:(NSString *)text;

//去掉html标签
+(NSString *)filterHTML:(NSString *)html;

+(UIColor*)colorWithType:(NSString*)type;

//排除系统九宫格输入
+ (BOOL)isContainEmoji:(NSString *)string;
// 判断是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string;

#pragma mark -- 数据转json字符串
+(NSString*)DataTOjsonString:(id)object;
#pragma mark -- 字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (NSArray *)arrayWithJsonString:(NSString *)jsonString;
// 将JSON串转化为字典或者数组  数组转换字符串
+ (id)toArrayOrNSDictionary:(NSData *)jsonData;
// 将字典或者数组转化为JSON串
+ (NSData *)toJSONData:(id)theData;

//给HTML加上图片自适应屏幕宽度和文字适配屏幕换行
+(NSString*)importHtmlHead:(NSString*)html;

//没有图文详情时用这个
+(NSString*)emptyhtml;

#pragma mark -- 设置label的上下间距
+ (NSAttributedString *)attribteLabelLineSpacing:(NSString *)str font:(NSInteger)fontInt lineSpacInt:(NSInteger)lineSpacInt;


//生成二维码图片
+ (UIImage*)createQrImage:(NSString*)string;

+(UIImage*)getGrayImage:(UIImage*)sourceImage;

// 给label加横线
+ (void)priceAddLine:(UILabel *)priceL lineColor:(NSString *)colorStr;


// 多行内容加上下间隙
// frame的height不用设置
+ (UILabel *)contentLabel:(NSString *)str lineSpacInt:(NSInteger)spacInt fontSize:(NSInteger)fontSize frame:(CGRect)frame cgsize:(CGSize)cgSize;

//view 按比例缩放
+(void)viewTransform:(UIView*)view proportion:(float)p;

+ (void) shakeToShow:(UIView*)aView Block:(void(^)(void))block;

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace Alignment:(NSTextAlignment)alignment;

// label中插入图片
+ (NSAttributedString *)attribteLabelInsertImage:(NSString *)imgStr labelStr:(NSString *)labelStr insertInt:(NSInteger)insertInt cgRect:(CGRect)frame;
+ (void)drawBorderLine:(UIView *)drawView lineColoStr:(NSString *)lineColor;

//加阴影
+(void)Shadow:(CALayer *)layer width:(CGFloat)width height:(CGFloat)height Radius:(CGFloat)Radius Opacity:(CGFloat)Opacity color:(NSString *)color;
/**
 * 手机号码隐藏
 */
+ (NSString*)safePhoneNumber:(NSString*)phoneNumber;

//下拉刷新/上拉加载更多控件结束刷新
+ (void)configRefreshWithScrollView:(UIScrollView*)scrollView hasMoreData:(BOOL)hasMoreData hasError:(BOOL)hasError;

//从拼接图片url字符串获取第一张图片url
+ (NSString*)firstImageUrlFromUrlComponents:(NSString*)urlComponents;

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

/**
 * 字符串判空
 */
+ (BOOL)stringIsEmpty:(NSString*)string;

/**
 * 安全字符串
 */
+ (NSString*)safeString:(NSString*)string;


+ (UIFont*)fontMake:(CGFloat)fontSize;

+ (UIFont*)boldFontMake:(CGFloat)fontSize;

/**
 * 将NSArray中的NSNull类型转化成@""
 */
+ (id)changeType:(id)myObj;

@end
