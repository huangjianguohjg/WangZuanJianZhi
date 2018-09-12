//
//  HJGDeliverController.m
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGDeliverController.h"
#import "HJGDeliverCommenTableViewCell.h"
#import "HJGDeliverBottomTableViewCell.h"
@interface HJGDeliverController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *rootTableView;

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
    
    [self rootTableView];
}

- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] initWithFrame:CGRectMake(0, kMarginTopHeight, WIDTH, HEIGHT - kMarginTopHeight)];
        [self.view addSubview:theView];
        theView.dataSource = self;
        [theView registerClass:[HJGDeliverCommenTableViewCell class] forCellReuseIdentifier:[HJGDeliverCommenTableViewCell getCellIdentifier]];
        [theView registerClass:[HJGDeliverBottomTableViewCell class] forCellReuseIdentifier:[HJGDeliverBottomTableViewCell getCellIdentifier]];
        theView.delegate = self;
        _rootTableView = theView;
    }
    return _rootTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (indexPath.row == 3) {
        HJGDeliverBottomTableViewCell *bCell = [tableView dequeueReusableCellWithIdentifier:[HJGDeliverBottomTableViewCell getCellIdentifier]];
        cell = bCell;
    }else{
        HJGDeliverCommenTableViewCell *CCell = [tableView dequeueReusableCellWithIdentifier:[HJGDeliverCommenTableViewCell getCellIdentifier]];
        
        cell = CCell;
        
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 3) {
        return H(200);
    }else{
        return H(70);
    }
}
@end
