//
//  EDBaseDefine.h
//  PowerRamp
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 mac. All rights reserved.
//

#import "EDUtils.h"

#ifndef EDBaseMacroDefine_h
#define EDBaseMacroDefine_h

// 判断是否为刘海屏
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

/**
 * 原生控件高度
 */
#define EDNavBar_H (IPHONE_X ? 88.0f:64.0f)
#define EDTabBar_H (IPHONE_X ? 83.0f:49.0f)
#define EDMistake_H (IPHONE_X ? 58.0f:0.0f)
#define EDViewTop_H (IPHONE_X ? 44.0f:0.0f)
#define EDViewBottom_H (IPHONE_X ? 34.0f:0.0f)
#define EDStatus_H (IPHONE_X ? 44.0f:20.0f)

//屏幕的宽、高
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

//常用线宽
#define APPCONFIG_UNIT_LINE_WIDTH (1/[UIScreen mainScreen].scale)

//初始化定义
#define EDRectDefine CGFloat x = 0; CGFloat y = 0; CGFloat width = 0; CGFloat height = 0;

#define EDUrlWithString(string) [NSURL URLWithString:string]

//默认正方形图片
#define DEFAULT_IMAGE_SQUARE @"placeholder_image"

//默认正方形图片轮播
#define DEFAULT_IMAGE_SQUARE_BANNER @"placeholder_image_big"

//默认长方形图片
#define DEFAULT_IMAGE_RECTANGLE @"default_rectangle"

// 无数据
#define DEFAULT_IMAGE_NODATA @"transaction4"

//默认头像
#define DEFAULT_IMAGE_HEAD @"default_head"

/************************************************************/

//*  账号相关

//登录状态
#define EDLoginStatus    @"LoginStatus"
//登录数据
#define EDLoginData    @"LoginData"
//登录Token
#define EDLoginToken     @"LoginToken"
//登录用户名
#define EDLoginAccount     @"LoginAccount"
//自动登录
#define EDAutoLogin     @"AutoLogin"

/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

///判断系统版本
#define IOS_VERSION_6_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IOS_VERSION_7_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_VERSION_8_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_VERSION_9_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS_VERSION_10_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)


#pragma mark - 常用

#define EDAppVersion ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])

#define iOS_Version ([[[UIDevice currentDevice] systemVersion] floatValue])

#define EDUserDefaults       [NSUserDefaults standardUserDefaults]

#define EDNotificationCenter [NSNotificationCenter defaultCenter]

#define EDApplication        [UIApplication sharedApplication]

#define EDAppDelegate        ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define EDFileManager        [NSFileManager defaultManager]

#define EDBundle             [NSBundle mainBundle]

#define EDDevice             [UIDevice currentDevice]

#define EDCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define EDKeyWindow          [[UIApplication sharedApplication] keyWindow]

#define EDInfoDictionary     [[NSBundle mainBundle] infoDictionary]

#define EDBundleVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define EDBundleBuild        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define EDDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define EDCachesDirectoryPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define EDBundleLoadNibName(name) [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject]

#define EDDispatch_Global(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define EDDispatch_Main(block) dispatch_async(dispatch_get_main_queue(),block)

///弱指针
#define EDWeakSelf __weak typeof(self) weakSelf = self;


#pragma mark - 数据类型转换

#define EDSafeString(string) [NSString stringWithFormat:@"%@", string]

#define EDIntValue(string) [string integerValue]

#define EDDoubleValue(string) [string doubleValue]


#pragma mark - 判空处理

//判断对象是否为空
#define EDISNIL(temp)     (temp == nil || [temp isKindOfClass:[NSNull class]])

//字符串是否为空
#define EDStringIsEmpty(str) (str && [[NSString stringWithFormat:@"%@", str] length] > 0 ? NO : YES)

//数组是否为空
#define EDArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

//字典是否为空
#define EDDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || dic.count == 0)

//是否是空对象
#define EDObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/**
 * 弹出提示框
 */
#define EDTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

/**
 * 通知名称
 */
// 注册通知
#define EDAddObserver(methodName,notificationName,auserInfo) [[NSNotificationCenter defaultCenter] addObserver:self selector:(methodName) name:(notificationName) object:(auserInfo)];

// 发送通知
#define EDPostNotification(notificationName,auserInfo) [[NSNotificationCenter defaultCenter] postNotificationName:(notificationName) object:self userInfo:(auserInfo)];

// 移除通知
#define RemoveNotification(notificationName,auserInfo) [[NSNotificationCenter defaultCenter]removeObserver:self name:(notificationName) object:auserInfo];

//UserDefaults存取
#pragma NSUserDefaults

#define EDUserDefaults [NSUserDefaults standardUserDefaults]
#define EDUserDefaultsSave(value,key) [EDShare saveValue:value forKey:key]
#define EDUserDefaultsValue(key) [EDShare valueWithKey:key]


//获取图片资源
#define EDImageWithContentsOfFileExt(imageName,ext) [UIImage imageWithContentsOfFile:[NSBundle mainBundle]pathForResource:imageName ofType:ext]
#define EDImageWithContentsOfFile(imageName) [UIImage imageWithContentsOfFile:[NSBundle mainBundle] pathForResource:imageName ofType:nil]
#define IMAGENAME(name) [UIImage imageNamed:name]


#pragma mark - 字体

/**
 * 普通字体
 */
#define EDFont(size) [UIFont systemFontOfSize:size]
#define EDBoldFont(size) [UIFont boldSystemFontOfSize:size]

/**
 * 适配屏幕字体
 */
#define EDAutoFont(size) [UIFont systemFontOfSize:size * SCREEN_W/375]
#define EDAutoBoldFont(size) [UIFont boldSystemFontOfSize:size * SCREEN_W/375]


/**
 *  字符size高
 */
#define EM_MULTILINE_TEXTSIZE(text, fontSize, maxSize) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size : CGSizeZero;

/**
 *  字符串宽度
 */
#define EM_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;

#pragma mark - 日志

/**
 * 打印
 * __PRETTY_FUNCTION__ 方法名 c字符串
 * __LINE__ 打印行数
 * ## "##"放在","和参数之间，那么如果参数留空的话，那么"##"前面的","就会删掉，从而防止编译错误。
 * ((void)0) 在C、C++中表示无任何操作（详见http://stackoverflow.com/questions/2198950/why-is-void-0-a-no-operation-in-c-and-c）
 */

// 正式环境屏蔽控制台打印
#ifdef RELEASE
    #define NSLog(FORMAT, ...) nil
#else
    #define NSLog(FORMAT, ...) fprintf(stderr,"<%s : %d>\n%s\n%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__ ,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#endif

#endif /* EDBaseDefine_h */
