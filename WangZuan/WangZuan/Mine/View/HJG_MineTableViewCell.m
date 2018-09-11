//
//  HJG_MineTableViewCell.m
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_MineTableViewCell.h"

@implementation HJG_MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI{
    
    [self iconView];
    
    [self titleLab];
    
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(25), H(25)));
            make.left.equalTo(self.contentView).offset(W(20));
            make.centerY.equalTo(self.contentView);
        }];
        _iconView = theView;
    }
    return _iconView;
}


- (UILabel *)titleLab
{
    if (!_titleLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.textColor = [UIColor blackColor];
        theView.font = [UIFont systemFontOfSize:W(16)];
        theView.text = @"我的兼职";
        theView.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.height.equalTo(H(20));
            make.left.equalTo(self.iconView.right).offset(W(15));
        }];
        _titleLab = theView;
    }
    return _titleLab;
}

@end
