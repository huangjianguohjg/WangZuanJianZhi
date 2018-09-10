//
//  HJG_SchoolController.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_SchoolController.h"
#import "HJG_SchoolTableViewCell.h"
#import "HJGSchoolModel.h"
@interface HJG_SchoolController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) NSMutableArray *arr;


@end

@implementation HJG_SchoolController

- (NSMutableArray *)arr{
    
    if (!_arr) {
        _arr= [NSMutableArray array];
        
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self.arr removeAllObjects];
    [self configNav];
    
    [self configView];
    
    [self getdata];
    
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"学校";
    
}

#pragma mark - configView
- (void)configView{
    
    [self rootTableView];
    
    
}

- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] initWithFrame:CGRectMake(0, kMarginTopHeight, WIDTH, HEIGHT - kMarginTopHeight - kTabBarHeight)];
        [self.view addSubview:theView];
        theView.delegate = self;
        theView.dataSource = self;
        [theView registerClass:[HJG_SchoolTableViewCell class] forCellReuseIdentifier:[HJG_SchoolTableViewCell getCellIdentifier]];
        _rootTableView = theView;
    }
    return _rootTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HJG_SchoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HJG_SchoolTableViewCell getCellIdentifier]];
    cell.model = [self.arr safeObjectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return H(500);
}


- (void)getdata{
    
    //https://raw.githubusercontent.com/huangjianguohjg/json/master/ewew.json

    [HJGNetManger getUrl:@"https://raw.githubusercontent.com/huangjianguohjg/json/master/ewew.json" IsNeedCashe:NO dic:@{} responseSuccess:^(id response) {
        DLog(@"%@",response);
        [response[@"d"] enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HJGSchoolModel *model= [HJGSchoolModel mj_objectWithKeyValues:obj];
            [self.arr addObject:model];
        }];
        [self.rootTableView reloadData];
    } responseFail:^(NSError *error) {
        
    }];
    
}

@end
