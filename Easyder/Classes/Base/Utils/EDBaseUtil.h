//
//  EDBaseUtil.h
//  PowerRamp
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseUtil : NSObject

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert alpha:(CGFloat)alpha;

+ (void)configRefreshWithScrollView:(UIScrollView*)scrollView hasMoreData:(BOOL)hasMoreData hasError:(BOOL)hasError;

+ (NSString*)createFormatHtmlStringWithString:(NSString*)string width:(CGFloat)width;

+ (void)makePhoneCall:(NSString*)tel;

/**
 * 手机号码隐藏
 */
+ (NSString*)safePhoneNumber:(NSString*)phoneNumber;

//获取ios设备号
+ (NSString *)getDeviceModel;

+ (void)copyToPasteboard:(NSString*)content;

@end

NS_ASSUME_NONNULL_END
