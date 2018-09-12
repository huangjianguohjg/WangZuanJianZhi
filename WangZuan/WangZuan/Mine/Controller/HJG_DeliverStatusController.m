//
//  HJG_DeliverStatusController.m
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_DeliverStatusController.h"
#import "HJG_DeliverStatusTableViewCell.h"
#import "HJGHomeModel.h"
@interface HJG_DeliverStatusController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) NSMutableArray *modelArr;

@end

@implementation HJG_DeliverStatusController

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
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"我发布的订单";
    
}

#pragma mark - configView
- (void)configView{
    
    [self rootTableView];
    
    [self getData];
    
}

- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] initWithFrame:CGRectMake(0, kMarginTopHeight, WIDTH, HEIGHT - kMarginTopHeight)];
        [self.view addSubview:theView];
        theView.delegate = self;
        [theView registerClass:[HJG_DeliverStatusTableViewCell class] forCellReuseIdentifier:[HJG_DeliverStatusTableViewCell getCellIdentifier]];
        theView.dataSource = self;
        _rootTableView = theView;
    }
    return _rootTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HJG_DeliverStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HJG_DeliverStatusTableViewCell getCellIdentifier]];
    
    cell.model = [self.modelArr safeObjectAtIndex:indexPath.row];
    cell.moneyLab.text = @"正在等待审核";
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return H(120);
}

- (void)getData{
    NSString *url = [NSString stringWithFormat:@"http://api.fewpod.com/api/jobs/my?token=%@",[HJGSaveTool objectForKey:Tokken]];
    [HJGNetManger getUrl:url IsNeedCashe:NO dic:@{} responseSuccess:^(id response) {
       
        [response[@"data"][@"list"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HJGHomeModel *model = [HJGHomeModel mj_objectWithKeyValues:obj];
            [self.modelArr addObject:model];
        }];
        [self.rootTableView reloadData];
        
    } responseFail:^(NSError *error) {
        
    }];
    
    
}



@end
