//
//  HCToast.h
//  HCToast
//
//  Created by 何其灿 on 2018/9/12.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HCToastView : UIView

@end


@interface HCToast : NSObject

+(instancetype)shareInstance;


/**
 显示Toast

 @param message 提示文本内容
 */
-(void)showToast:(NSString *)message;

@end
