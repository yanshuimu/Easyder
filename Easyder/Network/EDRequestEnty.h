//
//  EDRequestEnty.h
//  common
//
//  Created by SPIWsx on 2017/7/25.
//  Copyright © 2017年 ED. All rights reserved.
//  请求实体，配置相关信息的，比如请求方式，请求地址，回调等等

#import <UIKit/UIKit.h>
#import "EDNetApiManager.h"

@interface EDRequestEnty : NSObject

//请求方式
@property (nonatomic) int requestType;

//请求地址
@property (nonatomic,copy) NSString *requestUrl;

//请求参数
@property (nonatomic,strong) id params;

//请求头
@property (nonatomic,strong) NSMutableDictionary *httpHeaderParams;

//超时时间
@property (nonatomic, assign) NSInteger timeoutInterval;

//是否开启日志打印
@property (nonatomic, assign) BOOL openLog;

//回调block
@property (nonatomic,copy) Response response;


/************************************************************/
//*  上传图片需要额外增加的参数
/************************************************************/

//单张图片实体
@property (nonatomic,strong) UIImage *singleImage;

//单张图片名字
@property (nonatomic,copy) NSString *singleImageName;

//多张图片实体
@property (nonatomic,strong) NSArray *imagesArray;

//多张图片名字
@property (nonatomic,strong) NSArray *imageNamesArray;

@end
