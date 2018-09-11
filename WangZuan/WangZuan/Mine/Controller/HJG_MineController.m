//
//  HJG_MineController.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_MineController.h"
#import "HJG_MineTableViewCell.h"
#import "HJG_LoginController.h"
#import "HJGAboutUSController.h"
#import "HJGDeliverController.h"
#import "HJG_DeliverStatusController.h"
@interface HJG_MineController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UIView *footV;

@end

@implementation HJG_MineController

- (UIView *)footV
{
    if (!_footV) {
        UIView * theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, H(200))];
        UIButton *but = [[UIButton alloc]init];
        [theView addSubview:but];
        but.backgroundColor = [UIColor brownColor];
        but.layer.cornerRadius = W(4);
        but.clipsToBounds = YES;
        [but setTitle:@"退出登录" forState:0];
        [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        but.titleLabel.font = [UIFont systemFontOfSize:W(17)];
        [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
        [but makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(theView);
            make.size.equalTo(CGSizeMake(W(100), H(50)));
        }];
        _footV = theView;
    }
    return _footV;
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        UIImageView * theView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, H(180))];
        theView.image = [UIImage imageNamed:@"dfgdfgfd"];
        _iconView = theView;
    }
    return _iconView;
}

- (void)butClick{
    
    DLog(@"fsdjlljfwjlfljkfljslfwllhfjkrw");
}

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
    
    [self rootTableView];
    
}

- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] initWithFrame:CGRectMake(0, kMarginTopHeight, WIDTH, HEIGHT - kMarginTopHeight - kTabBarHeight)];
        theView.delegate = self;
        theView.dataSource = self;
        theView.tableHeaderView = [self iconView];
        theView.tableHeaderView.height = H(180);
        [self.view addSubview:theView];
        [theView registerClass:[HJG_MineTableViewCell class] forCellReuseIdentifier:[HJG_MineTableViewCell getCellIdentifier]];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    HJG_MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HJG_MineTableViewCell getCellIdentifier]];
    
    switch (indexPath.row) {
        case 0:
            cell.iconView.image = [UIImage imageNamed:@"文章"];
            cell.titleLab.text = @"我的兼职";
            break;
        case 1:
            cell.iconView.image = [UIImage imageNamed:@"购物车"];
            cell.titleLab.text = @"发布兼职";
            break;
        case 2:
            cell.iconView.image = [UIImage imageNamed:@"闪电"];
            cell.titleLab.text = @"发布兼职状态";
            break;
        case 3:
            cell.iconView.image = [UIImage imageNamed:@"回形针"];
            cell.titleLab.text = @"关于我们";
            break;
        default:
            break;
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return H(50);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return [self footV];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return H(200);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        HJG_LoginController *vc = [[HJG_LoginController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        HJGAboutUSController *vc = [[HJGAboutUSController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        HJGDeliverController *vc = [[HJGDeliverController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        
        HJG_DeliverStatusController *vc = [[HJG_DeliverStatusController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
@end
