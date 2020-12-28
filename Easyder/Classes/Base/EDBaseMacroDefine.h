//
//  EDBaseDefine.h
//  PowerRamp
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 mac. All rights reserved.
//

#ifndef EDBaseMacroDefine_h
#define EDBaseMacroDefine_h

/************************************************************/
//*  尺寸
/************************************************************/
///屏幕的宽、高
#pragma mark - 设计稿尺寸:1024x768
//12.9 2732x2048 比例:1.33
//11.0 2388x1668 比例:1.17
//10.5 2224x1668 比例:1.08
//9.7 2048x1536  比例:1.00
//7.9 2048x1536  比例:1.00

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

#define SCREEN [UIScreen mainScreen].bounds.size

/**
 * 设计尺寸
 */
#define DESIGN_SIZE CGSizeMake(375, 667)

#define UIFontFromPixel(pixel) ([UIFont systemFontOfSize:((pixel*SCREEN_W)/2048.0)])
#define UIFontBoldFromPixel(pixel) ([UIFont boldSystemFontOfSize:((pixel*SCREEN_W)/2048.0)])

#define kUrlWithString(string) [NSURL URLWithString:string]

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
#define kLoginStatus    @"LoginStatus"
//登录数据
#define kLoginData    @"LoginData"
//登录Token
#define kLoginToken     @"LoginToken"
//登录用户名
#define kLoginAccount     @"LoginAccount"
//自动登录
#define kAutoLogin     @"kAutoLogin"

/************************************************************/

/************************************************************/

//*  网络请求

#define kPageKey @"page"
#define kPageSizeKey @"limit"
#define kDefaultPageSize @"10"

/************************************************************/

/************************************************************/

//*  国际化

#define kLanguageKey @"LanguageKey"
#define kLanguageTypeZh_CN @"zh"
#define kLanguageTypeEN @"en"

/************************************************************/

//*  iPhoneX

/************************************************************/

// 判断是否为iPhone X 系列  这样写消除了在Xcode10上的警告。
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


#define kNavBar_H (IPHONE_X ? 88.0f:64.0f)
#define kTabBar_H (IPHONE_X ? 83.0f:49.0f)
#define kMistake_H (IPHONE_X ? 58.0f:0.0f)
#define kViewTop_H (IPHONE_X ? 44.0f:0.0f)
#define kViewBottom_H (IPHONE_X ? 34.0f:0.0f)
#define kStatus_H (IPHONE_X ? 44.0f:20.0f)

#define APPCONFIG_UNIT_LINE_WIDTH                (1/[UIScreen mainScreen].scale)       //常用线宽

/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

///判断系统版本
#define IOS_VERSION_6_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IOS_VERSION_7_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_VERSION_8_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_VERSION_9_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS_VERSION_10_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

/************************************************************/

//*  常用

/************************************************************/

#pragma mark 用户信息和NSUserDefault

#define kAppVersion ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])

#define iOS_Version ([[[UIDevice currentDevice] systemVersion] floatValue])

#define kUserDefaults       [NSUserDefaults standardUserDefaults]

#define kNotificationCenter [NSNotificationCenter defaultCenter]

#define kApplication        [UIApplication sharedApplication]

#define kAppDelegate        ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define kFileManager        [NSFileManager defaultManager]

#define kBundle             [NSBundle mainBundle]

#define kDevice             [UIDevice currentDevice]

#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define kKeyWindow          [[UIApplication sharedApplication] keyWindow]

#define kInfoDictionary     [[NSBundle mainBundle] infoDictionary]

#define kBundleVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define kBundleBuild        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define kDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define kCachesDirectoryPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define kBundleLoadNibName(name) [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject]

#define kDispatch_Global(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define KDispatch_Main(block) dispatch_async(dispatch_get_main_queue(),block)

//用户单例
#define UserInstance [EDUserCenter sharedManager]

///弱指针
#define WeakSelf __weak typeof(self) weakSelf = self;

/**
 * 数据类型转换
 */
#define kSafeString(string) [NSString stringWithFormat:@"%@", string]

#define kIntValue(string) [string integerValue]

#define kDoubleValue(string) [string doubleValue]

/**
 * 判空处理
 */
//判断对象是否为空
#define ISNIL(temp)     (temp == nil || [temp isKindOfClass:[NSNull class]])

//字符串是否为空
#define kStringIsEmpty(str) (str && [[NSString stringWithFormat:@"%@", str] length] > 0 ? NO : YES)

//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || dic.count == 0)

//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/**
 * 弹出提示框
 */
#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

/**
 * 通知名称
 */
//未知网络状态通知
#define EDNetworkReachabilityStatusUnknown      @"EDNetworkReachabilityStatusUnknown"
//网络不可用通知
#define EDNetworkReachabilityStatusNotReachable @"EDNetworkReachabilityStatusNotReachable"
//网络可用通知
#define EDNetworkReachabilityStatusReachable    @"EDNetworkReachabilityStatusReachable"

// 注册通知
#define AddObserver(methodName,notificationName,auserInfo) [[NSNotificationCenter defaultCenter] addObserver:self selector:(methodName) name:(notificationName) object:(auserInfo)];

// 发送通知
#define PostNotification(notificationName,auserInfo) [[NSNotificationCenter defaultCenter] postNotificationName:(notificationName) object:self userInfo:(auserInfo)];

// 移除通知
#define RemoveNotification(notificationName,auserInfo) [[NSNotificationCenter defaultCenter]removeObserver:self name:(notificationName) object:auserInfo];

//UserDefaults存取
#pragma NSUserDefaults

#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kUserDefaultsSave(value,key) [EDShare saveValue:value forKey:key]
#define kUserDefaultsValue(key) [EDShare valueWithKey:key]


//获取图片资源
#define kImageWithContentsOfFileExt(imageName,ext) [UIImage imageWithContentsOfFile:[NSBundle mainBundle]pathForResource:imageName ofType:ext]
#define kImageWithContentsOfFile(imageName) [UIImage imageWithContentsOfFile:[NSBundle mainBundle] pathForResource:imageName ofType:nil]
#define IMAGENAME(name) [UIImage imageNamed:name]

/**
 * 普通字体
 */
#define kFont(size) [UIFont systemFontOfSize:size]
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]

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


//取三个数最大值
#define MAXTHREE(a,b,c) (a>b?(a>c?a:c):(b>c?b:c))


///当前日期字符串
#define DATE_STRING \
({NSDateFormatter *fmt = [[NSDateFormatter alloc] init];\
[fmt setDateFormat:@"YYYY-MM-dd hh:mm:ss"];\
[fmt stringFromDate:[NSDate date]];})


///区分ARC和非ARC
#if  __has_feature(objc_arc)

//ARC
#else
//非ARC
#endif


///区分设备和模拟器
#if TARGET_OS_IPHONE

//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR

//iPhone Simulator
#endif

/**
 * 有效性验证<字符串、数组、字典等>
 */
#define VALID_STRING(str)      ((str) && ([(str) isKindOfClass:[NSString class]]) && ([(str) length] > 0))
#define VALID_ARRAY(arr)       ((arr) && ([(arr) isKindOfClass:[NSArray class]]) && ([(arr) count] > 0))
#define VALID_DICTIONARY(dict) ((dict) && ([(dict) isKindOfClass:[NSDictionary class]]) && ([(dict) count] > 0))
#define VALID_NUMBER(number)   ((number) && ([(number) isKindOfClass:NSNumber.class]))


/**
 * 打印
 * __PRETTY_FUNCTION__ 方法名 c字符串
 * __LINE__ 打印行数
 * ## "##"放在","和参数之间，那么如果参数留空的话，那么"##"前面的","就会删掉，从而防止编译错误。
 * ((void)0) 在C、C++中表示无任何操作（详见http://stackoverflow.com/questions/2198950/why-is-void-0-a-no-operation-in-c-and-c）
 */

#ifdef DEBUG
    //-- 区分设备和模拟器,
    //解决Product -> Scheme -> Run -> Arguments -> OS_ACTIVITY_MODE为disable时，真机下 Xcode Debugger 不打印的bug ---
    #if TARGET_OS_IPHONE
    /*iPhone Device*/
    #define DLog(format, ...) printf("%s:Dev: %s [Line %d]\n%s\n\n", [DATE_STRING UTF8String], __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String])
    #else
    /*iPhone Simulator*/
    #define DLog(format, ...) NSLog((@":Sim: %s [Line %d]\n%@\n\n"), __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:format, ##__VA_ARGS__])
    #endif
#else
    #define DLog(...) ((void)0)
#endif

// 正式环境屏蔽控制台打印
#ifdef RELEASE206
    #define NSLog(FORMAT, ...) nil
#elif RELEASE
    #define NSLog(FORMAT, ...) nil
#elif RELEASE_APPSTORE
    #define NSLog(FORMAT, ...) nil
#else
    #define NSLog(FORMAT, ...) fprintf(stderr,"<%s : %d>\n%s\n%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__ ,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#endif

#endif /* EDBaseDefine_h */
