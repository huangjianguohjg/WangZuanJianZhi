//
//  HJG_SchoolTableViewCell.h
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGBaseTableViewCell.h"
#import "HJGSchoolModel.h"

@interface HJG_SchoolTableViewCell : HJGBaseTableViewCell

@property (nonatomic, weak) UILabel *titleLab;

@property (nonatomic, weak) UIImageView *picView;

@property (nonatomic, weak) UILabel *contentLab;
@property (nonatomic, strong) HJGSchoolModel *model;

@end
