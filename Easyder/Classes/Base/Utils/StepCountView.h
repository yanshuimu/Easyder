//
//  StepCountView.h
//  MYYManager
//
//  Created by mac on 2019/4/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StepCountView : UIView

//
@property (nonatomic, copy) void (^didStepButtonClickBlock)(BOOL isAdd);
//
@property (nonatomic, copy) void (^textFieldChangeBlock)(NSString *text);
//
@property (nonatomic, strong) UITextField *numTF;
//自动隐藏减按钮
@property (nonatomic, assign) BOOL hideReduceBtnByNum;
//限制最大值
@property (nonatomic, assign) NSInteger maxnum;
//限制最小值
@property (nonatomic, assign) NSInteger minnum;
//是否允许输入
@property (nonatomic, assign) BOOL inputEnable;

- (void)addNumber;

- (void)reduceCacheNumber;

- (void)setCacheNumber:(NSString*)aNumber;


@end

NS_ASSUME_NONNULL_END
