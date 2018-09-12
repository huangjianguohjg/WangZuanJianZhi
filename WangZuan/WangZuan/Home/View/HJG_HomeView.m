
//
//  HJG_HomeView.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_HomeView.h"
#import "HJG_HomeTableViewCell.h"
#import "HJGHomeModel.h"
@interface HJG_HomeView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@end

@implementation HJG_HomeView


- (SDCycleScrollView *)cycleView
{
    if (!_cycleView) {
        SDCycleScrollView * theView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, H(200))];
        theView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        theView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        theView.pageDotColor = [UIColor colorWithHexRGB:0xe4e4e4];
        theView.placeholderImage = [UIImage imageNamed:@"luobo1"];
        theView.autoScrollTimeInterval = 1.f;
        theView.localizationImageNamesGroup = @[@"1",@"2",@"3"];
        
        _cycleView = theView;
    }
    return _cycleView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    [self rootTableView];
    
}

- (void)setModelArr:(NSMutableArray *)modelArr{
    
    _modelArr = modelArr;
    
    [self.rootTableView reloadData];
}

- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] init];
        [self addSubview:theView];
        theView.delegate = self;
        theView.dataSource = self;
        
        theView.frame = self.bounds;
        [theView registerClass:[HJG_HomeTableViewCell class] forCellReuseIdentifier:[HJG_HomeTableViewCell getCellIdentifier]];
        theView.tableHeaderView = self.cycleView;
        theView.tableHeaderView.height = H(200);
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HJG_HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HJG_HomeTableViewCell getCellIdentifier]];
    cell.model = [self.modelArr safeObjectAtIndex:indexPath.row];
    [cell.jubaoBut addTarget:self action:@selector(jubaoButClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.jiedanBut addTarget:self action:@selector(jiedanButClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}


- (void)jubaoButClick:(UIButton *)but{
    
    HJG_HomeTableViewCell *cell = (HJG_HomeTableViewCell *)but.superview.superview;
    
    NSIndexPath *indexP= [self.rootTableView indexPathForCell:cell];
    HJGHomeModel *model = [self.modelArr safeObjectAtIndex:indexP.row];
    
    NSDictionary *dic = @{
                          @"why":@"内容不正确"
                          };
    NSString *url = [NSString stringWithFormat:@"http://api.fewpod.com/api/jobs/jubao/%@?token=%@",model.ID,[HJGSaveTool objectForKey:Tokken]];
    DLog(@"%@",url);
    [HJGNetManger postUrl:url paramDic:dic IsNeedCashe:NO responseSuccess:^(id response) {
        DLog(@"%@",response);
        if ([((NSString *)response[@"msg"]) containsString:@"举报完成"]) {
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showSuccessWithStatus:@"举报完成！！！,我们会认真审核"];
        }
    } responseFail:^(NSError *error) {
        
    }];
    
    
}

- (void)jiedanButClick:(UIButton *)but{
    HJG_HomeTableViewCell *cell = (HJG_HomeTableViewCell *)but.superview.superview;
    
    NSIndexPath *indexP= [self.rootTableView indexPathForCell:cell];
    HJGHomeModel *model = [self.modelArr safeObjectAtIndex:indexP.row];
    
        NSString *url = [NSString stringWithFormat:@"http://api.fewpod.com/api/jobs/jiedan/%@?token=%@",model.ID,[HJGSaveTool objectForKey:Tokken]];
     DLog(@"%@",url);
    [HJGNetManger postUrl:url paramDic:@{} IsNeedCashe:NO responseSuccess:^(id response) {
        if ([((NSString *)response[@"msg"]) containsString:@"分配给"]) {
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showSuccessWithStatus:response[@"msg"]];
        }
    } responseFail:^(NSError *error) {
        
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return H(120);
}





@end
