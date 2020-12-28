//
//  StepCountView.m
//  MYYManager
//
//  Created by mac on 2019/4/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import "StepCountView.h"

@interface StepCountView ()
//
@property (nonatomic, assign) CGFloat selfWidth;
//
@property (nonatomic, assign) CGFloat selfHeight;
//
@property (nonatomic, strong) UIButton *addBtn;
//
@property (nonatomic, strong) UIButton *subBtn;
//
@property (nonatomic, assign) NSInteger number;
@end

@implementation StepCountView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 80, 25)]) {
        
        self.userInteractionEnabled = YES;
        _hideReduceBtnByNum = YES;
        _maxnum = -1;
        self.layer.borderColor = EDColor(@"#CCCCCC").CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 4;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    CGFloat x = 0; CGFloat y = 0; CGFloat width = 0; CGFloat height = 0;
    
    x = self.width - self.height;
    width = height = self.height;
    _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _addBtn.frame = CGRectMake(x, y, width, height);
    [_addBtn setTitle:@"+" forState:UIControlStateNormal];
    [_addBtn setTitleColor:kFontColorLightBlack forState:UIControlStateNormal];
    _addBtn.titleLabel.font = kFont(16);
    [_addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
    
    x = self.height;
    width = self.width - self.height * 2;
    _numTF = [[UITextField alloc] init];
    _numTF.frame = CGRectMake(x, y, width, height);
    _numTF.font = kFont(14);
    _numTF.textColor = kFontColorLightBlack;
    _numTF.keyboardType = UIKeyboardTypeNumberPad;
    _numTF.textAlignment = NSTextAlignmentCenter;
    _numTF.text = @"1";
    [_numTF addTarget:self action:@selector(numTextFieldEditingEnd:) forControlEvents:UIControlEventEditingDidEnd];
    [self addSubview:_numTF];
    
    x = 0;
    width = self.height;
    _subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _subBtn.frame = CGRectMake(x, y, width, height);
    [_subBtn setTitle:@"-" forState:UIControlStateNormal];
    _subBtn.titleLabel.font = kFont(16);
    [_subBtn setTitleColor:kFontColorLightBlack forState:UIControlStateNormal];
    [_subBtn addTarget:self action:@selector(subBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_subBtn];
    
    x = 25;
    height = self.height;
    width = 1;
    [self addVerticalLineWithFrame:CGRectMake(x, y, width, height)];
    
    x = self.width - 25;
    [self addVerticalLineWithFrame:CGRectMake(x, y, width, height)];
}

- (void)addVerticalLineWithFrame:(CGRect)frame
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = EDColor(@"#CCCCCC");
    [self addSubview:line];
}

- (void)addBtnClick {
    if (_didStepButtonClickBlock) {
        _didStepButtonClickBlock(YES);
    }
}

- (void)subBtnClick {
    if (_didStepButtonClickBlock) {
        _didStepButtonClickBlock(NO);
    }
}

- (void)updateNumber:(NSInteger)number
{
    _number = number;
    /*
    if (_number <= 0)
    {
        //等于0则隐藏-按钮
        _subBtn.hidden = YES;
        _numTF.hidden = YES;
    }
    else
    {
        //大于0则显示-按钮
        _subBtn.hidden = NO;
        _numTF.hidden = NO;
    }
    */
    _numTF.text = [NSString stringWithFormat:@"%zd", _number];
}

- (void)addNumber
{
    _number++;
    
    //如果限制最大值
    if (_maxnum != -1)
    {
        //最多加到最大值
        if (_number >= _maxnum)
        {
            _number = _maxnum;
        }
    }
    [self updateNumber:_number];
}

- (void)reduceCacheNumber
{
    if (_hideReduceBtnByNum)
    {
        _number--;
    }
    else
    {
        _number--;
        if (_number <= _minnum)
        {
            _number = _minnum;
        }
    }
    [self updateNumber:_number];
}

- (void)setCacheNumber:(NSString*)aNumber
{
    [self updateNumber:aNumber.integerValue];
}

- (void)numTextFieldEditingEnd:(UITextField*)sender {
    
    /*
    _number = kIntValue(sender.text);
    
    if (_number != 0)
    {
        if (_textFieldChangeBlock) {
            _textFieldChangeBlock(sender.text);
        }
    }
    */
    
    if (_textFieldChangeBlock) {
        _textFieldChangeBlock(sender.text);
    }
}

- (void)setInputEnable:(BOOL)inputEnable {
    _inputEnable = inputEnable;
    _numTF.enabled = inputEnable;
}

@end
