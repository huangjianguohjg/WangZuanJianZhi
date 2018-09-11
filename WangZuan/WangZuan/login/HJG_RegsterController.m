//
//  HJG_RegsterController.m
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_RegsterController.h"

@interface HJG_RegsterController ()

@property (nonatomic, strong) UITextField *repeatField;

@end

@implementation HJG_RegsterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.registerBut.alpha = 0.f;
    self.forgetBut.alpha = 0.f;
    self.phoneTextField.placeholder = @"请输入用户名";
    [self.loginBut setTitle:@"注册" forState:0];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (UITextField *)repeatField
{
    if (!_repeatField) {
        UITextField * theView = [[UITextField alloc] init];
        [self.view addSubview:theView];
        _repeatField = theView;
    }
    return _repeatField;
}


@end
