//
//  HJGDeliverBottomTableViewCell.m
//  WangZuan
//
//  Created by Developer on 2018/9/12.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGDeliverBottomTableViewCell.h"

@implementation HJGDeliverBottomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI{
    
    [self iconView];
    
    [self textF];
    
    [self deliverBut];
    
}


- (UIImageView *)iconView
{
    if (!_iconView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.backgroundColor= [UIColor greenColor];
        
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(15));
            make.top.equalTo(self.contentView).offset(H(20));
            make.size.equalTo(CGSizeMake(W(20), H(20)));
        }];
        _iconView = theView;
    }
    return _iconView;
}

- (UITextField *)textF
{
    if (!_textF) {
        UITextField * theView = [[UITextField alloc] init];
        theView.placeholder = @"请输入兼职要求";
        theView.textColor = [UIColor darkTextColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.font = [UIFont systemFontOfSize:W(15)];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconView.right).offset(W(10));
            make.right.equalTo(self.contentView).offset(-W(15));
            make.bottom.equalTo(self.deliverBut.top).offset(-H(15));
            make.top.equalTo(self.iconView);
        }];
        _textF = theView;
    }
    return _textF;
}

- (UIButton *)deliverBut
{
    if (!_deliverBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"发布兼职信息" forState:0];
        theView.layer.cornerRadius = W(12);
        theView.clipsToBounds = YES;
        [theView setTitleColor:[UIColor whiteColor] forState:0];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(20) weight:UIFontWeightBold];
        theView.backgroundColor = [UIColor brownColor];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(W(19));
            make.right.equalTo(self.contentView).offset(-W(19));
            make.height.equalTo(H(72));
        }];
        _deliverBut = theView;
    }
    return _deliverBut;
}
@end
