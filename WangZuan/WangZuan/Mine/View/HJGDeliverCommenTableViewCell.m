//
//  HJGDeliverCommenTableViewCell.m
//  WangZuan
//
//  Created by Developer on 2018/9/12.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGDeliverCommenTableViewCell.h"

@implementation HJGDeliverCommenTableViewCell

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
    
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(W(30), H(30)));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(W(15));
        }];
        _iconView = theView;
    }
    return _iconView;
}

- (UITextField *)textF
{
    if (!_textF) {
        UITextField * theView = [[UITextField alloc] init];
        theView.placeholder = @"请输入信息";
        theView.textAlignment = NSTextAlignmentLeft;
        theView.font = [UIFont systemFontOfSize:W(15)];
        theView.textColor = [UIColor darkTextColor];
        
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.iconView.right).offset(W(20));
            make.size.equalTo(CGSizeMake(W(150), H(25)));
        }];
        _textF = theView;
    }
    return _textF;
}
@end
