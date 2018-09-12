//
//  HJG_DeliverStatusTableViewCell.m
//  WangZuan
//
//  Created by Developer on 2018/9/12.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_DeliverStatusTableViewCell.h"

@implementation HJG_DeliverStatusTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI{
    
    self.jubaoBut.alpha = 0.f;
    self.jiedanBut.alpha = 0.f;
    self.moneyLab.text = @"正在等待审核";
    
}

@end
