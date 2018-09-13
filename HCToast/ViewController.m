//
//  ViewController.m
//  HCToast
//
//  Created by 何其灿 on 2018/9/12.
//  Copyright © 2018年 松小宝. All rights reserved.
//

#import "ViewController.h"
#import "HCToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 50);
    [btn setTitle:@"验证码校验" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 50);
    [btn2 setTitle:@"登录" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(touchAction2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 50);
    [btn3 setTitle:@"下单" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(touchAction3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(0, 500, [UIScreen mainScreen].bounds.size.width, 50);
    [btn4 setTitle:@"订单状态" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(touchAction4:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(0, 600, [UIScreen mainScreen].bounds.size.width, 50);
    [btn5 setTitle:@"订单状态" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(touchAction5:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
}

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
    [[HCToast shareInstance] showTopToast:@"您的咖啡已制作完成，等待送达！您的咖啡已制作完成，等待送达！您的咖啡已制作完成，等待送达！"];
}

-(void)touchAction5:(id)sender{
    [[HCToast shareInstance] showTopToast:@"您的咖啡已送出，马上就到~" offsetY:20.f];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
