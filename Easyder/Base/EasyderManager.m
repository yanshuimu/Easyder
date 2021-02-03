//
//  EasyderManager.m
//  Easyder
//
//  Created by xuhonggui on 2020/12/29.
//

#import "EasyderManager.h"
#import "EDBaseMacroDefine.h"
#import "GHConsole.h"

#define ED_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define ED_IS_PAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

static EasyderManager *manager = nil;

@interface EasyderManager ()

@end

@implementation EasyderManager

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[EasyderManager alloc] init];
        [manager initialize];
    });
    return manager;
}

- (void)initialize {
    
    if (ED_IS_PAD) {
        _widthRatio = [UIScreen mainScreen].bounds.size.width/1024.0;
        _heightRatio = [UIScreen mainScreen].bounds.size.height/768.0;
    }
    else {
        _widthRatio = [UIScreen mainScreen].bounds.size.width/375.0;
        _heightRatio = [UIScreen mainScreen].bounds.size.height/667.0;
    }
    _themeColor = [UIColor whiteColor];
    
    [EDUserDefaults removeObjectForKey:EDConsoleEnabled];
}

- (void)startMoninNet {
    
    if (!_moninNet) {
        _moninNet = [[EDMoninNet alloc] init];
    }
    [_moninNet startMoninNet];
}

- (void)stopMoninNet {
    
    [_moninNet stopMoninNet];
}

- (void)setConsoleEnable:(BOOL)consoleEnable {
    
    GHConsole *console = [GHConsole sharedConsole];
    
    if (consoleEnable) {
        [EDUserDefaults setValue:@"1" forKey:EDConsoleEnabled];
        [EDUserDefaults synchronize];
        [console startPrintLog];
    }
    else {
        [EDUserDefaults removeObjectForKey:EDConsoleEnabled];
        [EDUserDefaults synchronize];
        [console stopPrinting];
    }
}

- (void)setConsoleEnableBySilent:(BOOL)consoleEnableBySilent {
    
    GHConsole *console = [GHConsole sharedConsole];
    
    if (consoleEnableBySilent) {
        [EDUserDefaults setValue:@"1" forKey:EDConsoleEnabled];
        [EDUserDefaults synchronize];
        [console startPrintLog];
        [console setIsSilent:YES];
    }
    else {
        [EDUserDefaults removeObjectForKey:EDConsoleEnabled];
        [EDUserDefaults synchronize];
        [console stopPrinting];
    }
}

@end
