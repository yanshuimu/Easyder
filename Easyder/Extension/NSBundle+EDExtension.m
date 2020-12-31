//
//  NSBundle+EDExtension.m
//  Easyder
//
//  Created by mac on 2020/12/31.
//

#import "NSBundle+EDExtension.h"

@implementation NSBundle (EDExtension)

+ (instancetype)easyderBundle {
    
    static NSBundle *easyderBundle = nil;
    if (easyderBundle == nil) {
        NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"Easyder")];
        NSString *path = [bundle pathForResource:@"Easyder" ofType:@"bundle"];
        easyderBundle = [NSBundle bundleWithPath:path];
    }
    return easyderBundle;
}

+ (UIImage*)imageFromEasyderBundleWithName:(NSString*)imageName {
    
    static UIImage *image = nil;
    if (image == nil) {
        imageName = [NSString stringWithFormat:@"%@@2x", imageName];
        image = [[UIImage imageWithContentsOfFile:[[self easyderBundle] pathForResource:imageName ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return image;
}

@end
