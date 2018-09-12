//
//  HJG_HomeController.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_HomeController.h"
#import "HJG_HomeView.h"
#import "HJGHomeModel.h"
@interface HJG_HomeController ()

@property (nonatomic, strong) HJG_HomeView *homeView;

@property (nonatomic, strong) NSMutableArray *modelArr;

@end

@implementation HJG_HomeController

- (NSMutableArray *)modelArr{
    
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    
    return _modelArr;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configNav];
    
    [self configView];
    
    [self getHomeData];
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

- (void)getHomeData{
    
    [HJGNetManger getUrl:@"http://api.fewpod.com/api/jobs" IsNeedCashe:NO dic:@{} responseSuccess:^(id response) {
        
        [self.modelArr removeAllObjects];
        [response[@"data"][@"list"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HJGHomeModel *model = [HJGHomeModel mj_objectWithKeyValues:obj];
            [self.modelArr addObject:model];
        }];
        self.homeView.modelArr = self.modelArr;
        
    } responseFail:^(NSError *error) {
        
    }];
    
    
}

@end
