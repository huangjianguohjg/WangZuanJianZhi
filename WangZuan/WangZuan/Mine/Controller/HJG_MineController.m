//
//  HJG_MineController.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_MineController.h"

@interface HJG_MineController ()

@end

@implementation HJG_MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configNav];
    
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"个人中心";
    
}

#pragma mark - configView
- (void)configView{
    
    
}

@end
