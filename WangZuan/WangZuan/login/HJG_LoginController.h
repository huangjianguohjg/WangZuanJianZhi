//
//  HJG_LoginController.h
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGBaseController.h"

@interface HJG_LoginController : HJGBaseController

@property (nonatomic, strong) UIImageView *topImageView;

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UITextField *phoneTextField;

@property (nonatomic, strong) UITextField *passWordTextfield;

@property (nonatomic, strong) UIButton *loginBut;

@property (nonatomic, strong) UIButton *registerBut;

@property (nonatomic, strong) UIButton *forgetBut;

- (void)actionClick;
@end
