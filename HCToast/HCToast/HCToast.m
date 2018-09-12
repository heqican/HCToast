//
//  HCToast.m
//  HCToast
//
//  Created by 何其灿 on 2018/9/12.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import "HCToast.h"

#define UI_SCREEN_WIDTH         ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT        ([[UIScreen mainScreen] bounds].size.height)

#define Toast_Duration_Normal 2.0f //默认逗留时长

static const CGFloat Interval_Size_5 = 5.0f;
static const CGFloat Interval_Size_20 = 20.0f;
static const CGFloat Interval_Size_25 = 25.0f;
static const CGFloat Interval_Size_30 = 30.0f;
static const CGFloat Normal_Size_Width = 260.0f;

#pragma mark - HCToastView

@interface HCToastView()
@property (strong,nonatomic) UILabel *textLabel;
@end

@implementation HCToastView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void)setTextMessage:(NSString *)message{
    self.textLabel.text = message;
    CGRect rect =[self.textLabel.text  boundingRectWithSize:CGSizeMake(Normal_Size_Width, MAXFLOAT)
                                                    options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                 attributes:@{NSFontAttributeName:self.textLabel.font} context:nil];
    self.textLabel.textAlignment = (rect.size.width>180.0f) ? NSTextAlignmentCenter : NSTextAlignmentLeft;
    self.textLabel.frame = CGRectMake(Interval_Size_25/2, Interval_Size_20/2, rect.size.width, rect.size.height);
    [self addSubview:self.textLabel];
    
    CGFloat width = rect.size.width+Interval_Size_25;
    CGFloat height = rect.size.height+Interval_Size_20;
    CGFloat x = (UI_SCREEN_WIDTH - width)/2;
    CGFloat y = (UI_SCREEN_HEIGHT -height)/2;
    self.layer.cornerRadius = 2;
    self.layer.masksToBounds = YES;
    self.frame = CGRectMake(x, y, width, height);
}

#pragma mark - Lazy load
@synthesize textLabel = _textLabel;
-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.numberOfLines = 0;
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

@end


#pragma mark - HCToast

@interface HCToast()
@property (strong,nonatomic) HCToastView *toastView;
@property (assign,nonatomic) NSTimeInterval duration;
@end

@implementation HCToast

+(instancetype)shareInstance{
    static HCToast *hcToast = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hcToast = [[HCToast alloc] init];
    });
    return hcToast;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.toastView = [[HCToastView alloc] init];
    }
    return self;
}

-(void)showToast:(NSString *)message{
    [[HCToast shareInstance] showToastViewWithMessage:message duration:Toast_Duration_Normal];
}

-(void)showToastViewWithMessage:(NSString *)message duration:(NSTimeInterval)duration{
    if ([self isEmptyObj:message]) {
        return;
    }
    self.duration = duration;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.toastView];
    
    //显示
    [self.toastView setTextMessage:message];
    
    self.toastView.center = [UIApplication sharedApplication].keyWindow.center;
    
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationWithDismiss)];
    self.toastView.alpha = 0.8;
    [UIView commitAnimations];
    
}

-(void)animationWithDismiss{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:self.duration?self.duration:Toast_Duration_Normal];//逗留时长
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationForViewRemove)];
    self.toastView.alpha = 0;
    [UIView commitAnimations];
}

- (void)animationForViewRemove{
    [self.toastView removeFromSuperview];
}

#pragma mark - Utils
- (BOOL)isEmptyObj:(id)o
{
    if (o==nil) {
        return YES;
    }
    if (o==NULL) {
        return YES;
    }
    if ([o isKindOfClass:[NSNull class]]) {
        return YES;
    }

    if ([o isKindOfClass:[NSData class]]) {
        return [((NSData *)o) length]<=0;
    }
    if ([o isKindOfClass:[NSDictionary class]]) {
        return [((NSDictionary *)o) count]<=0;
    }
    if ([o isKindOfClass:[NSArray class]]) {
        return [((NSArray *)o) count]<=0;
    }
    if ([o isKindOfClass:[NSSet class]]) {
        return [((NSSet *)o) count]<=0;
    }
    return NO;
}

@end
