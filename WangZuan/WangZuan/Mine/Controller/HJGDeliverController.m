//
//  HJGDeliverController.m
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGDeliverController.h"

@interface HJGDeliverController ()

@end

@implementation HJGDeliverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configNav];
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"发布兼职";
    
}

#pragma mark - configView
- (void)configView{
    
    
}

@end
