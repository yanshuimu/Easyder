//
//  EDSwitchDomainController.m
//  Kehouyi
//
//  Created by apple on 2019/8/16.
//  Copyright © 2019 xuhonggui. All rights reserved.
//

#import "EDSwitchDomainController.h"

#define EDSwitchDomainIPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define EDSwitchDomainScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define EDSwitchDomainScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define EDSwitchDomainNavBar_H (EDSwitchDomainIPHONE_X ? 88.0f:64.0f)

#define EDSwitchDomainViewBottom_H (EDSwitchDomainIPHONE_X ? 34.0f:0.0f)

#define EDSwitchDomainStatus_H (EDSwitchDomainIPHONE_X ? 44.0f:20.0f)

#define EDSwitchDomainFontColorDefault [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]

#define EDSwitchDomainFontColorLightGray [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]

#define EDSwitchDomainDefaultBackgroudColor [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]

#define EDSwitchDomainStringIsEmpty(str) (str && [NSString stringWithFormat:@"%@", str].length > 0 ? NO : YES)

#define EDSwitchDomainBundleVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define EDSwitchDomainBundleBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define EDSwitchDomainTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

@interface EDSwitchDomainController ()
//
@property (nonatomic, strong) NSMutableArray *btnArray;
//
@property (nonatomic, strong) UITextField *textField;
//
@property (nonatomic, strong) NSArray *domainArray;
//
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation EDSwitchDomainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"内测版";
    self.view.backgroundColor = EDSwitchDomainDefaultBackgroudColor;
    _btnArray = [NSMutableArray array];
    [self setupSubviews];
}

- (void)setupSubviews
{
    _config = [EDConfig switchDomainControllerConfig];
    
    _domainArray = _config.domainArray;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = 0;
    CGFloat height = 0;
    
    if (!self.navigationController) {
        y = EDSwitchDomainStatus_H;
    }
    width = EDSwitchDomainScreenWidth;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    [self.view addSubview:_scrollView];
    
    x = 14;
    y = 10;
    width = EDSwitchDomainScreenWidth - x * 2;
    height = 30;
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
    titleLab.text = @"备选域名：";
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textColor = EDSwitchDomainFontColorDefault;
    [_scrollView addSubview:titleLab];
    
    for (int i = 0; i < _domainArray.count; i++) {
        y = CGRectGetMaxY(titleLab.frame) + i * (height);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x, y, width, height);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        if (_config.domainRemarkArray.count > 0 && i < _config.domainRemarkArray.count) {
            NSString *remark = _config.domainRemarkArray[i];
            [btn setTitle:[NSString stringWithFormat:@"%d、%@（%@）", i+1, _domainArray[i], remark] forState:UIControlStateNormal];
        }
        else {
            [btn setTitle:[NSString stringWithFormat:@"%d、%@", i+1, _domainArray[i]] forState:UIControlStateNormal];
        }
        btn.tag = i;
        [btn setTitleColor:EDSwitchDomainFontColorDefault forState:UIControlStateNormal];
        [_scrollView addSubview:btn];
        [_btnArray addObject:btn];
        [btn addTarget:self action:@selector(domainButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UILabel *lastLab = [_btnArray lastObject];
    y = CGRectGetMaxY(lastLab.frame) + 2;
    UILabel *currentLab = [[UILabel alloc] init];
    currentLab.frame = CGRectMake(x, y, width, height);
    currentLab.font = [UIFont systemFontOfSize:14];
    currentLab.textColor = EDSwitchDomainFontColorDefault;
    currentLab.text = @"当前域名：";
    [_scrollView addSubview:currentLab];
    
    y = CGRectGetMaxY(currentLab.frame);
    height = 28;
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(x, y, width, height);
    textField.font = [UIFont systemFontOfSize:14];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.placeholder = @"请点击备选域名或输入域名";
    textField.textColor = EDSwitchDomainFontColorDefault;
    [_scrollView addSubview:textField];
    _textField = textField;
    
    y = CGRectGetMaxY(textField.frame) + 10;
    height = 0.5;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    line.backgroundColor = EDSwitchDomainFontColorLightGray;
    [_scrollView addSubview:line];
    
    x = 14;
    width = EDSwitchDomainScreenWidth - x * 2;
    height = 48;
    y = CGRectGetMaxY(line.frame) + 14;
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(x, y, width, height);
    [sureBtn setTitle:@"进入应用" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    sureBtn.layer.cornerRadius = 4;
    if ([self themeColor]) {
        sureBtn.backgroundColor = [self themeColor];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        sureBtn.backgroundColor = [UIColor whiteColor];
        [sureBtn setTitleColor:EDSwitchDomainFontColorDefault forState:UIControlStateNormal];
        sureBtn.layer.borderWidth = 0.5;
        sureBtn.layer.borderColor = EDSwitchDomainFontColorLightGray.CGColor;
    }
    [_scrollView addSubview:sureBtn];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    y = CGRectGetMaxY(sureBtn.frame) + 15;
    height = 22;
    UILabel *markLab = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
    markLab.text = @"备注：";
    markLab.font = [UIFont systemFontOfSize:13];
    markLab.textColor = [UIColor darkGrayColor];
    [_scrollView addSubview:markLab];
    
    y = CGRectGetMaxY(markLab.frame);
    UILabel *descLab = [[UILabel alloc] init];
    descLab.numberOfLines = 0;
    descLab.textColor = [UIColor darkGrayColor];
    [_scrollView addSubview:descLab];

    descLab.attributedText = [self createRemarkText];
    
    height = [descLab.attributedText boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    descLab.frame = CGRectMake(x, y, width, height);
    
    CGRect frame = _scrollView.frame;
    if (self.navigationController != nil) {
        frame.size.height = EDSwitchDomainScreenHeight - EDSwitchDomainNavBar_H - EDSwitchDomainViewBottom_H;
    }
    else {
        frame.size.height = EDSwitchDomainScreenHeight;
    }
    _scrollView.frame = frame;
    _scrollView.contentSize = CGSizeMake(frame.size.width, descLab.frame.origin.y + descLab.frame.size.height + 1);
    
    NSString *lastDomain = [EDSwitchDomainUserDefaults valueForKey:EDSwitchDomainLastDomain];
    if (!EDSwitchDomainStringIsEmpty(lastDomain)) {
        _textField.text = lastDomain;
        if ([self themeColor]) {
            for (int i = 0; i < _domainArray.count; i++) {
                NSString *domain = _domainArray[i];
                if ([domain isEqualToString:lastDomain]) {
                    UIButton *btn = _btnArray[i];
                    [btn setTitleColor:[self themeColor] forState:UIControlStateNormal];
                }
            }
        }
    }
}

- (NSAttributedString*)createRemarkText {
    
    NSString *string = [NSString stringWithFormat:@"\t此版本仅供内部测试使用，请勿发布传播。首次进入需点击备选域名或手动输入域名，接着点击“进入应用”按钮即可。\n版本号：%@\n构建版本：%@", EDSwitchDomainBundleVersion, EDSwitchDomainBundleBuild];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 3.5;
    [attString addAttributes:@{NSParagraphStyleAttributeName: style, NSFontAttributeName: [UIFont systemFontOfSize:13]} range:NSMakeRange(0, string.length)];
    return attString;
}

- (UIColor*)themeColor {
    
    if (!self.navigationController) {
        return nil;
    }
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    UIColor *color = navigationBar.barTintColor;
    if (CGColorEqualToColor(color.CGColor, [UIColor whiteColor].CGColor)) {
        return nil;
    }
    return color;
}

- (void)sureBtnClick
{
    NSString *domain = [_textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (EDSwitchDomainStringIsEmpty(domain)) {
        EDSwitchDomainTipAlert(@"请点击备选域名或输入域名");
        return;
    }
    
    [self.view endEditing:YES];
    
    NSString *lastDomain = [EDSwitchDomainUserDefaults valueForKey:EDSwitchDomainLastDomain];
    if (!EDSwitchDomainStringIsEmpty(lastDomain)) {
        if ([domain isEqualToString:lastDomain]) {
            [self autoLogin];
        }
        else {
            [self gotoLogin];
        }
    }
    else {
        [self gotoLogin];
    }
    
    [EDSwitchDomainUserDefaults setValue:domain forKey:EDSwitchDomainLastDomain];
    [EDSwitchDomainUserDefaults synchronize];
}

- (void)autoLogin
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.config.autoLoginBlock) self.config.autoLoginBlock();
    });
}

- (void)gotoLogin
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.config.reLoginBlock) self.config.reLoginBlock();
    });
}

- (void)domainButtonClick:(UIButton*)sender
{
    NSString *domain = _domainArray[sender.tag];
    _textField.text = domain;
    
    for (UIButton *btn in _btnArray) {
        [btn setTitleColor:EDSwitchDomainFontColorDefault forState:UIControlStateNormal];
    }
    
    if ([self themeColor]) {
        [sender setTitleColor:[self themeColor] forState:UIControlStateNormal];
    }
}

@end
