#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    UILabelCountingMethodEaseInOut,
    UILabelCountingMethodEaseIn,
    UILabelCountingMethodEaseOut,
    UILabelCountingMethodLinear
} UILabelCountingMethod;

typedef NSString* (^UICountingLabelFormatBlock)(double value);
typedef NSAttributedString* (^UICountingLabelAttributedFormatBlock)(double value);

@interface UICountingLabel : UILabel

@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSString *positiveFormat; // 如果浮点数需要千分位分隔符，须使用@"###,##0.00"进行控制样式
@property (nonatomic, assign) UILabelCountingMethod method;
@property (nonatomic, assign) NSTimeInterval animationDuration;

@property (nonatomic, copy) UICountingLabelFormatBlock formatBlock;
@property (nonatomic, copy) UICountingLabelAttributedFormatBlock attributedFormatBlock;
@property (nonatomic, copy) void (^completionBlock)();

-(void)countFrom:(float)startValue to:(double)endValue;
-(void)countFrom:(float)startValue to:(double)endValue withDuration:(NSTimeInterval)duration;

-(void)countFromCurrentValueTo:(float)endValue;
-(void)countFromCurrentValueTo:(float)endValue withDuration:(NSTimeInterval)duration;

-(void)countFromZeroTo:(float)endValue;
-(void)countFromZeroTo:(float)endValue withDuration:(NSTimeInterval)duration;

- (CGFloat)currentValue;

@end

