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

+ (UIImage*)returnImageFromEasyderBundle {
    
    static UIImage *returnImage = nil;
    if (returnImage == nil) {
        returnImage = [[UIImage imageWithContentsOfFile:[[self easyderBundle] pathForResource:@"nav_return@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return returnImage;
}

+ (UIImage*)imageFromEasyderBundleWithName:(NSString*)imageName {
    
    imageName = [NSString stringWithFormat:@"%@@2x", imageName];
    UIImage *image = [[UIImage imageWithContentsOfFile:[[self easyderBundle] pathForResource:imageName ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
