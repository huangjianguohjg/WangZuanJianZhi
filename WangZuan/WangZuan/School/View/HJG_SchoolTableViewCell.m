//
//  HJG_SchoolTableViewCell.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_SchoolTableViewCell.h"

@implementation HJG_SchoolTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setModel:(HJGSchoolModel *)model{
    _model = model;
    
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    
    self.titleLab.text = model.name;
    
    self.contentLab.text = model.content
    ;
    
}

#pragma mark - setupUI
- (void)setupUI{
    
    [self titleLab];
    
    [self picView];
    
    [self contentLab];
    
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.font = [UIFont systemFontOfSize:W(19)];
        theView.textColor = [UIColor blackColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.text = @"人文社区图书馆";
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(15));
            make.top.equalTo(self.contentView).offset(H(10));
            make.height.equalTo(H(25));
        }];
        _titleLab = theView;
    }
    return _titleLab;
}


- (UIImageView *)picView
{
    if (!_picView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.backgroundColor= [UIColor redColor];
        
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(15));
            make.right.equalTo(self.contentView).offset(-W(15));
            make.top.equalTo(self.titleLab.bottom).offset(H(10));
            make.height.equalTo(H(200));
        }];
        _picView = theView;
    }
    return _picView;
}

- (UILabel *)contentLab
{
    if (!_contentLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"各单位共和国和各单位环境我待会九宫格还记得我好几个单位和较高的很干净的环境无公害国家电网贾湖骨笛我会加很多感觉我";
        theView.numberOfLines = 0;
        theView.textAlignment = NSTextAlignmentLeft;
        theView.textColor = [UIColor darkGrayColor];
        theView.font = [UIFont systemFontOfSize:W(14)];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.picView);
            make.top.equalTo(self.picView.bottom).offset(H(12));
            make.bottom.equalTo(self.contentView).offset(-H(15));
        }];
        _contentLab = theView;
    }
    return _contentLab;
}

@end
