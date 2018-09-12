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
#import <BADataEntity.h>
@interface HJGDeliverController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) HJGDeliverCommenTableViewCell *cell1;
@property (nonatomic, strong) HJGDeliverCommenTableViewCell *cell2;
@property (nonatomic, strong) HJGDeliverCommenTableViewCell *cell3;
@property (nonatomic, strong) HJGDeliverBottomTableViewCell *cell4;


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
        [bCell.deliverBut addTarget:self action:@selector(postData) forControlEvents:UIControlEventTouchUpInside];
        bCell.iconView.image = [UIImage imageNamed:@"wenjian1"];
        self.cell4 = bCell;
        cell = bCell;
    }else{
        HJGDeliverCommenTableViewCell *CCell = [tableView dequeueReusableCellWithIdentifier:[HJGDeliverCommenTableViewCell getCellIdentifier]];
        
        if (indexPath.row == 0) {
            CCell.textF.placeholder = @"请输入你的名字";
            CCell.iconView.image = [UIImage imageNamed:@"renwu1"];
            self.cell1 = CCell;
        }else if (indexPath.row == 1){
            CCell.textF.placeholder = @"请输入劳动报酬";
            CCell.iconView.image = [UIImage imageNamed:@"qian1"];
            self.cell2 = CCell;
        }else if (indexPath.row == 2){
            CCell.textF.placeholder = @"请输入您的手机号";
            CCell.iconView.image = [UIImage imageNamed:@"phone1"];
            self.cell3 = CCell;
        }
        
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

- (void)postData{
    
    if (self.cell1.textF.text.length > 0 &&self.cell2.textF.text.length>0&&self.cell3.textF.text.length > 0&&self.cell4.textF.text.length > 0) {}else{
        [SVProgressHUD setMinimumDismissTimeInterval:2.f];
        [SVProgressHUD showErrorWithStatus:@"请将信息填写完整"];
    }
    
    NSDictionary *dic = @{
                          @"content":self.cell4.textF.text,
                          @"money":self.cell2.textF.text,
//                          @"name":self.cell1.textF.text,
                          @"name":self.cell1.textF.text,
                          @"phone":self.cell3.textF.text
                          
                          };

    NSString *url = [NSString stringWithFormat:@"http://api.fewpod.com/api/jobs/save?token=%@",[HJGSaveTool objectForKey:Tokken]];

    [HJGNetManger postUrl:url paramDic:dic IsNeedCashe:NO responseSuccess:^(id response) {
        
        if (response[@"error"]) {
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showErrorWithStatus:response[@"msg"]];
        }else{
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showSuccessWithStatus:@"发布成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
        
    } responseFail:^(NSError *error) {
        
    }];
    
}
@end
