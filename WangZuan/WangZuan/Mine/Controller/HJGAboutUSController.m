//
//  HJGAboutUSController.m
//  WangZuan
//
//  Created by Developer on 2018/9/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGAboutUSController.h"

@interface HJGAboutUSController ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *contentLab;

@end

@implementation HJGAboutUSController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configNav];
    
    [self configView];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"关于我们";
    
}

#pragma mark - configView
- (void)configView{
    
    [self iconView];
    
    [self titleLab];
    
    [self contentLab];
    
    
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"4324"];
        theView.layer.cornerRadius = W(3);
        theView.clipsToBounds = YES;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(kMarginTopHeight + H(15));
            make.centerX.equalTo(self.view);
            make.size.equalTo(CGSizeMake(W(50), H(50)));
        }];
        _iconView = theView;
    }
    return _iconView;
}


- (UILabel *)titleLab
{
    if (!_titleLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"闲时小赚";
        theView.font = [UIFont systemFontOfSize:W(18) weight:UIFontWeightBold];
        theView.textAlignment = NSTextAlignmentCenter;
        theView.textColor = [UIColor brownColor];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconView.bottom).offset(H(20));
            make.centerX.equalTo(self.iconView);
            make.height.equalTo(H(25));
        }];
        _titleLab = theView;
    }
    return _titleLab;
}


- (UILabel *)contentLab
{
    if (!_contentLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.textColor = [UIColor darkGrayColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.font = [UIFont systemFontOfSize:W(14)];
        theView.text = @"    闲时小赚的创作初衷是为了缓解一部分学生上学，为家庭带来的经济压力，让学生可以利用自己的碎片化时间，周六周日的空余时间可以通过自己的劳动赚取自己日常生活费用。这一个想法得到了在校学生的大力支持，经过我们一个月市场调研，后台设计，产品研发，软件开发，终于把这款app开发出来，希望我们的团队的努力可以给更多的人带来便利，我们也承诺维护好这款App的生态环境,禁止虚假信息，避免不必要的麻烦。";
        theView.numberOfLines = 0;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(W(15));
            make.right.equalTo(self.view).offset(-W(15));
            make.top.equalTo(self.titleLab.bottom).offset(H(20));
        }];
        _contentLab = theView;
    }
    return _contentLab;
}



@end
