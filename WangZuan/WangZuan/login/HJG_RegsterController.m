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


- (void)actionClick
{
    NSDictionary *dic = @{
                          @"password":self.passWordTextfield.text,
                          @"username":self.phoneTextField.text,
                          @"captcha":@"pass",
                          @"realname":@"小赚",
                          @"phone":@"18350867903"
                          
                          };
    
    [HJGNetManger postUrl:@"http://api.fewpod.com/api/register" paramDic:dic IsNeedCashe:NO responseSuccess:^(id response) {
        DLog(@"%@",response);
        
        if ([((NSString *)response[@"msg"]) containsString:@"注册完成"]) {
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showSuccessWithStatus:@"注册成功!"];
            [HJGSaveTool setObject:response[@"token"] forKey:Tokken];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showErrorWithStatus:@"密码必须同时含有数字，大小写字母，特殊字符"];
        }
        
    } responseFail:^(NSError *error) {
        
    }];
    
    
}

@end
