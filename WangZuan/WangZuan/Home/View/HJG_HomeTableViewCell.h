//
//  HJG_HomeTableViewCell.h
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGBaseTableViewCell.h"
#import "HJGHomeModel.h"
@interface HJG_HomeTableViewCell : HJGBaseTableViewCell

@property (nonatomic, weak) UILabel *lianxiLab;

@property (nonatomic, weak) UIButton *phoneBut;

@property (nonatomic, weak) UILabel *contentLab;


@property (nonatomic, weak) UILabel *moneyLab;

@property (nonatomic, weak) UIButton *jubaoBut;

@property (nonatomic, weak) UIButton *jiedanBut;

@property (nonatomic, strong) HJGHomeModel *model;
@end
