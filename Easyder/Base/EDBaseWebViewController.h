//
//  EDBaseWebViewController.h
//  Kehouyi
//
//  Created by mac on 2019/12/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import "EDBaseViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDBaseWebViewController : EDBaseViewController

@property (nonatomic, strong) WKWebView *webView;
//
@property (nonatomic, copy) NSString *navTitle;
//富文本
@property (nonatomic, copy) NSString *htmlString;
//
@property (nonatomic, copy) NSString *url;

/**
 * 加载富文本
 */
- (void)loadHtmlContent;

@end

NS_ASSUME_NONNULL_END
