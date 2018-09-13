·-松小宝-
# HCToast
Toast 提示框控件

使用方法：
#import "HCToast.h"

-(void)touchAction:(id)sender{
    [[HCToast shareInstance] showToast:@"验证码错误"];
}

-(void)touchAction2:(id)sender{
    [[HCToast shareInstance] showSuccessIconToast:@"登录成功"];
}

-(void)touchAction3:(id)sender{
    [[HCToast shareInstance] showErrorIconToast:@"还没登录，请先登录再进行下单！"];
}

-(void)touchAction4:(id)sender{
    [[HCToast shareInstance] showTopToast:@"您的咖啡已制作完成，等待送达！"];
}

-(void)touchAction5:(id)sender{
    [[HCToast shareInstance] showTopToast:@"您的咖啡已送出，马上就到~" offsetY:20.f];
}


