//
//  HJG_HomeTableViewCell.m
//  WangZuan
//
//  Created by Developer on 2018/9/10.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_HomeTableViewCell.h"

@implementation HJG_HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI{
    
    [self lianxiLab];
    
    [self phoneBut];
    
    [self contentLab];
    
    [self moneyLab];
    
    [self jubaoBut];
    
    [self jiedanBut];
    
}


- (UILabel *)lianxiLab
{
    if (!_lianxiLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.font = [UIFont systemFontOfSize:W(15) weight:UIFontWeightBold];
        theView.textColor = [UIColor blackColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.text = @"联系人李钟硕";
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(15));
            make.top.equalTo(self.contentView).offset(H(8));
            make.height.equalTo(H(20));
        }];
        _lianxiLab = theView;
    }
    return _lianxiLab;
}


- (UIButton *)phoneBut
{
    if (!_phoneBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"TEL:17878778878" forState:0];
        [theView setTitleColor:RGB(255, 197, 43) forState:0];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(15) weight:UIFontWeightBold];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lianxiLab);
            make.right.equalTo(self.contentView).offset(-W(15));
            make.size.equalTo(CGSizeMake(W(100), H(24)));
        }];
        _phoneBut = theView;
    }
    return _phoneBut;
}


- (UILabel *)contentLab
{
    if (!_contentLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.font = [UIFont systemFontOfSize:W(14)];
        theView.textColor = [UIColor darkGrayColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.text = @"带回家文化课的的考核金额的狂欢节的狂欢节的建行卡的黄金客户开奖狂欢节会尽快";
        theView.numberOfLines = 0;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lianxiLab.bottom).offset(H(3));
            make.left.equalTo(self.contentView).offset(W(15));
            make.right.equalTo(self.contentView).offset(-W(15));
            make.height.equalTo(H(50));
        }];
        _contentLab = theView;
    }
    return _contentLab;
}


- (UILabel *)moneyLab
{
    if (!_moneyLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"Y:10元";
        theView.textColor= [UIColor redColor];
        theView.font = [UIFont systemFontOfSize:W(14) weight:UIFontWeightBold];
        theView.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-H(10));
            make.height.equalTo(H(17));
            make.left.equalTo(self.contentView).offset(W(15));
        }];
        _moneyLab = theView;
    }
    return _moneyLab;
}

- (UIButton *)jubaoBut
{
    if (!_jubaoBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.backgroundColor = [UIColor redColor];
        [theView setTitle:@"举报" forState:0];
        [theView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(14) weight:UIFontWeightBold];
        theView.layer.cornerRadius = W(3);
        theView.clipsToBounds = YES;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.moneyLab);
            make.right.equalTo(self.jiedanBut.left).offset(-W(15));
            make.size.equalTo(self.jiedanBut);
        }];
        _jubaoBut = theView;
    }
    return _jubaoBut;
}

- (UIButton *)jiedanBut
{
    if (!_jiedanBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.backgroundColor = RGB(255, 199, 73);
        [theView setTitle:@"举报" forState:0];
        [theView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(14) weight:UIFontWeightBold];
        theView.layer.cornerRadius = W(3);
        theView.clipsToBounds = YES;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.moneyLab);
            make.right.equalTo(self.contentView).offset(-W(15));
            make.size.equalTo(CGSizeMake(W(50), H(26)));
        }];
        _jiedanBut = theView;
    }
    return _jiedanBut;
}

@end
