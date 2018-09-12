//
//  HJG_LoginController.m
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_LoginController.h"
#import "HJG_RegsterController.h"

@interface HJG_LoginController ()

@end

@implementation HJG_LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configNav];
    
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self wr_setNavBarBackgroundAlpha:0];
}

#pragma mark - configView
- (void)configView{
    
    [self topImageView];
    
    [self titleLab];
    [self phoneTextField];
    
    [self passWordTextfield];
    
    [self loginBut];
    
    [self registerBut];
    
    [self forgetBut];
}


- (UIImageView *)topImageView
{
    if (!_topImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"4324"];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(kMarginTopHeight + H(20));
            make.size.equalTo(CGSizeMake(W(60), H(60)));
        }];
        _topImageView = theView;
    }
    return _topImageView;
}


- (UILabel *)titleLab
{
    if (!_titleLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.textColor  = [UIColor brownColor];
        theView.font = [UIFont systemFontOfSize:W(17) weight:UIFontWeightBold];
        theView.textAlignment = NSTextAlignmentCenter;
        theView.text = @"学生空余时间兼职";
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topImageView.bottom).offset(H(20));
            make.centerX.equalTo(self.view);
            make.height.equalTo(H(25));
        }];
        _titleLab = theView;
    }
    return _titleLab;
}

- (UITextField *)phoneTextField
{
    if (!_phoneTextField) {
        UITextField * theView = [[UITextField alloc] init];
        theView.placeholder = @"请输入用户名";
        theView.textAlignment = NSTextAlignmentLeft;
        theView.font = [UIFont systemFontOfSize:W(16)];
        theView.textColor = [UIColor darkTextColor];
        theView.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, W(15), 0)];
        theView.leftViewMode = UITextFieldViewModeAlways;
        [theView addTarget:self action:@selector(phoneTextFieldChange:) forControlEvents:UIControlEventEditingChanged];
        theView.layer.cornerRadius = W(25);
        theView.layer.borderColor = [UIColor brownColor].CGColor;
        theView.layer.borderWidth = W(2);
        theView.clipsToBounds = YES;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(W(15));
            make.right.equalTo(self.view).offset(-W(15));
            make.top.equalTo(self.titleLab.bottom).offset(H(30));
            make.height.equalTo(H(50));
        }];
        _phoneTextField = theView;
    }
    return _phoneTextField;
}

- (void)passWordTextfieldChange:(UITextField *)field{
    
    if (self.phoneTextField.text.length > 0 &&self.passWordTextfield.text.length > 0) {
        self.loginBut.backgroundColor = [UIColor brownColor];
        [self.loginBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        self.loginBut.backgroundColor = [UIColor lightGrayColor];
        [self.loginBut setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    }
}

- (void)phoneTextFieldChange:(UITextField *)field{
    if (self.phoneTextField.text.length > 0 &&self.passWordTextfield.text.length > 0) {
        self.loginBut.backgroundColor = [UIColor brownColor];
        [self.loginBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        self.loginBut.backgroundColor = [UIColor lightGrayColor];
        [self.loginBut setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    }
    
}



- (UITextField *)passWordTextfield
{
    if (!_passWordTextfield) {
        UITextField * theView = [[UITextField alloc] init];
        theView.placeholder = @"请输入密码";
        theView.textAlignment = NSTextAlignmentLeft;
        theView.font = [UIFont systemFontOfSize:W(16)];
        theView.textColor = [UIColor darkTextColor];
        theView.layer.cornerRadius = W(25);
        [theView addTarget:self action:@selector(passWordTextfieldChange:) forControlEvents:UIControlEventEditingChanged];
        theView.layer.borderColor = [UIColor brownColor].CGColor;
        theView.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, W(15), 0)];
        theView.leftViewMode = UITextFieldViewModeAlways;
        theView.layer.borderWidth = W(2);
        theView.clipsToBounds = YES;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(W(15));
            make.right.equalTo(self.view).offset(-W(15));
            make.top.equalTo(self.phoneTextField.bottom).offset(H(20));
            make.height.equalTo(H(50));
        }];
        _passWordTextfield = theView;
    }
    return _passWordTextfield;
}

- (UIButton *)loginBut
{
    if (!_loginBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.backgroundColor= [UIColor lightGrayColor];
        theView.layer.cornerRadius = W(6);
        theView.clipsToBounds = YES;
        [theView setTitle:@"登录" forState:0];
        [theView setTitleColor:[UIColor brownColor] forState:0];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(18) weight:UIFontWeightBold];
        [theView addTarget:self action:@selector(loginButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(W(15));
            make.right.equalTo(self.view).offset(-W(15));
            make.top.equalTo(self.passWordTextfield.bottom).offset(H(26));
            make.height.equalTo(H(45));
        }];
        _loginBut = theView;
    }
    return _loginBut;
}

- (UIButton *)forgetBut
{
    if (!_forgetBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView addTarget:self action:@selector(forgetButClick) forControlEvents:UIControlEventTouchUpInside];
        [theView setTitleColor:[UIColor brownColor] forState:0];
        [theView setTitle:@"忘记密码" forState:0];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(15) weight:UIFontWeightBold];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.loginBut);
            make.top.equalTo(self.loginBut.bottom).offset(H(16));
            make.size.equalTo(CGSizeMake(W(100), H(30)));
        }];
        _forgetBut = theView;
    }
    return _forgetBut;
}

- (void)loginButClick{
    
    
    DLog(@"登录");
    
    if (self.phoneTextField.text.length == 0||self.passWordTextfield.text.length == 0) {
        [SVProgressHUD setMinimumDismissTimeInterval:2.f];
        [SVProgressHUD showErrorWithStatus:@"请填写用户名和密码"];
        return;
    }
    
    [self actionClick];
    
}
- (void)actionClick{
    
    NSDictionary *dic = @{
                          @"password":self.passWordTextfield.text,
                          @"username":self.phoneTextField.text,
                          @"captcha":@"pass",

                          
                          };
    
    [HJGNetManger postUrl:@"http://api.fewpod.com/api/login" paramDic:dic IsNeedCashe:NO responseSuccess:^(id response) {
        DLog(@"%@",response);

        if ([((NSString *)response[@"msg"]) containsString:@"完成"]) {
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showSuccessWithStatus:@"登录成功!"];
            [HJGSaveTool setObject:response[@"token"] forKey:Tokken];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showErrorWithStatus:response[@"msg"]];
        }
        
    } responseFail:^(NSError *error) {
        
    }];
    
    
}

- (void)forgetButClick{
    
    DLog(@"忘记密码");
    
    [WPSyncAlertView alert:@"请联系客服" title:@"按确认拨打客服电话" confirmButtonTitle:@"确认" cancelButtonTitle:@"取消" confirmed:^{
        NSString *telephoneNumber=@"18350862589";
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",telephoneNumber];
        UIApplication *application = [UIApplication sharedApplication];
        NSURL *URL = [NSURL URLWithString:str];
        [application openURL:URL options:@{} completionHandler:^(BOOL success) {
            //OpenSuccess=选择 呼叫 为 1  选择 取消 为0
            NSLog(@"OpenSuccess=%d",success);
            
        }];
    }];
}

- (void)registerButClick{
    
    DLog(@"注册账户");
    
    HJG_RegsterController *vc = [[HJG_RegsterController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)registerBut
{
    if (!_registerBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView addTarget:self action:@selector(registerButClick) forControlEvents:UIControlEventTouchUpInside];
        [theView setTitleColor:[UIColor brownColor] forState:0];
        [theView setTitle:@"注册账户" forState:0];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(15) weight:UIFontWeightBold];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.loginBut);
            make.top.equalTo(self.loginBut.bottom).offset(H(16));
            make.size.equalTo(CGSizeMake(W(100), H(30)));
        }];
        _registerBut = theView;
    }
    return _registerBut;
}
@end
