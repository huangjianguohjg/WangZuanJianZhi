//
//  HJG_HomeController.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_HomeController.h"
#import "HJG_HomeView.h"

@interface HJG_HomeController ()

@property (nonatomic, strong) HJG_HomeView *homeView;

@end

@implementation HJG_HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configNav];
    
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"首页";
    
}

- (HJG_HomeView *)homeView
{
    if (!_homeView) {
        HJG_HomeView * theView = [[HJG_HomeView alloc] initWithFrame:CGRectMake(0, kMarginTopHeight, WIDTH, HEIGHT - kMarginTopHeight - kTabBarHeight)];
        [self.view addSubview:theView];
        _homeView = theView;
    }
    return _homeView;
}

#pragma mark - configView
- (void)configView{
    
    [self homeView];
}

@end
