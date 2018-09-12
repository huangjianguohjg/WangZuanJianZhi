//
//  HJGMyListController.m
//  WangZuan
//
//  Created by Developer on 2018/9/12.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGMyListController.h"
#import "HJG_JieDanTableViewCell.h"
#import "HJGHomeModel.h"
@interface HJGMyListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) NSMutableArray *modelArr;

@end

@implementation HJGMyListController

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
    
    [self getListData];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"我的接单";
    
}

#pragma mark - configView
- (void)configView{
    
    [self rootTableView];
}


- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] initWithFrame:CGRectMake(0, kMarginTopHeight, WIDTH, HEIGHT - kMarginTopHeight)];
        theView.delegate = self;
        theView.dataSource = self;
        [theView registerClass:[HJG_JieDanTableViewCell class] forCellReuseIdentifier:[HJG_JieDanTableViewCell getCellIdentifier]];
        [self.view addSubview:theView];
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
    
    HJG_JieDanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HJG_JieDanTableViewCell getCellIdentifier]];
    cell.model = [self.modelArr safeObjectAtIndex:indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return H(120);
}

- (void)getListData{
    
    NSString *url = [NSString stringWithFormat:@"http://api.fewpod.com/api/jobs/tasks?token=%@",[HJGSaveTool objectForKey:Tokken]];
    
    [HJGNetManger getUrl:url IsNeedCashe:NO dic:@{} responseSuccess:^(id response) {
        DLog(@"%@",response);
        [self.modelArr removeAllObjects];
        
        if (((NSArray *)response[@"data"][@"list"]).count == 0) {
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showInfoWithStatus:@"暂无接单，快去大厅接单吧"];
        }
        [response[@"data"][@"list"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HJGHomeModel *model = [HJGHomeModel mj_objectWithKeyValues:obj];
            [self.modelArr addObject:model];
        }];
        [self.rootTableView reloadData];
    } responseFail:^(NSError *error) {
        
    }];
}


@end
