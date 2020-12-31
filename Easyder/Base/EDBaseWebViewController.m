//
//  EDBaseWebViewController.m
//  Kehouyi
//
//  Created by mac on 2019/12/20.
//  Copyright © 2019 mac. All rights reserved.
//

#import "EDBaseWebViewController.h"
#import "EDBaseMacroDefine.h"

@interface EDBaseWebViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation EDBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.navTitle;
    
    _webView = [[WKWebView alloc] init];
    _webView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - EDNavBar_H - EDViewBottom_H);
    _webView.backgroundColor = [UIColor clearColor];
    _webView.opaque = NO;
    _webView.scrollView.showsVerticalScrollIndicator = NO;
    _webView.scrollView.showsHorizontalScrollIndicator = NO;
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 2)];
    self.progressView.progressTintColor = EDThemeColor;
    self.progressView.trackTintColor = [UIColor clearColor];
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    [self.view addSubview:self.progressView];
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    if (!EDStringIsEmpty(_htmlString))
    {
        [self loadHtmlContent];
    }
    else if (!EDStringIsEmpty(_url))
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:EDUrlWithString(_url)];
        [_webView loadRequest:request];
    }
}

- (void)loadHtmlContent
{
    NSString *temp = [NSString stringWithFormat:@"<!DOCTYPE html>\n"
                      "<html>\n"
                      "<head>\n"
                      "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1 user-scalable=no\">\n"
                      "<style>\n"
                      "body{margin: 14px; color: #666666;}\n"
                      "</style>\n"
                      "</head>\n"
                      "<body>\n"
                      "%@\n"
                      "<script type='text/javascript'>\n"
                      "window.onload = function(){\n"
                      "var $img = document.getElementsByTagName('img');\n"
                      "for(var p in  $img){\n"
                      "$img[p].style.width = '100%%';\n"
                      "$img[p].style.height ='auto'\n"
                      "}\n"
                      "}\n"
                      "</script>\n"
                      "</body>\n"
                      "</html>", EDSafeString(_htmlString)];
    [_webView loadHTMLString:temp baseURL:nil];
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
    //加载完成后隐藏progressView
    //    self.progressView.hidden = YES;
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
    //加载失败同样需要隐藏progressView
    //    self.progressView.hidden = YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = _webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
