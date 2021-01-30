//
//  GHConsole.h
//  GHConsole
//
//  Created by liaoWorking on 22/11/2017.
//  Copyright © 2017 liaoWorking. All rights reserved.
//  https://github.com/Liaoworking/GHConsole for lastest version
//

#import <UIKit/UIKit.h>

#define GGLog(frmt, ...)    LOG_OBJC_MAYBE(frmt, ##__VA_ARGS__)

#define LOG_OBJC_MAYBE(frmt, ...) \
LOG_MAYBE(__PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)

#define LOG_MAYBE(fnct,frmt, ...)                       \
do { if(1 & 1) LOG_MACRO(fnct, frmt, ##__VA_ARGS__); } while(0)


#define LOG_MACRO(fnct, frmt, ...) \
[[GHConsole sharedConsole] function : fnct                          \
line : __LINE__                                           \
format : (frmt), ## __VA_ARGS__]

#define ConsoleLogDataKey @"textSaveKey"

#pragma mark- GHConsoleRootViewController
typedef void (^clearTextBlock)(void);
typedef void (^readTextBlock)(void);

@interface GHConsoleRootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    @public
    UITableView *_tableView;
    UIButton *_clearBtn;
    UIButton *_saveBtn;
    UIButton *_readLogBtn;
    UIButton *_minimize;
    UIImageView *_imgV;
}
@property (nonatomic) BOOL scrollEnable;
@property (nonatomic, copy) clearTextBlock clearLogText;
@property (nonatomic, copy) readTextBlock readLog;
@property (nonatomic,strong) void(^minimizeActionBlock)(void);
@property (nonatomic,copy) NSArray *dataSource;

- (void)saveText;

@end

@interface GHConsoleWindow : UIWindow

+ (instancetype)consoleWindow;

/**
  to make the GHConsole full-screen.
 */
- (void)maxmize;

/**
 to make the GHConsole at the right side in your app
 */
- (void)minimize;

/**
 the point of origin X-axis and Y-axis
 */
@property (nonatomic, assign)CGPoint axisXY;

@property (nonatomic,strong) GHConsoleRootViewController *consoleRootViewController;
@end

@interface GHConsole : NSObject

+ (instancetype)sharedConsole;

@property (nonatomic,strong) GHConsoleWindow *consoleWindow;
//是否静默打印
@property (nonatomic, assign) BOOL isSilent;

- (void)startPrintLog;

- (void)stopPrinting;

- (void)function:(const char *)function
            line:(NSUInteger)line
          format:(NSString *)format, ... NS_FORMAT_FUNCTION(3,4);

- (void)saveText;

- (void)clearAllText;

@end
