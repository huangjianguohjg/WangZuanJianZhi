//
//  HJG_JieDanTableViewCell.m
//  WangZuan
//
//  Created by Developer on 2018/9/12.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_JieDanTableViewCell.h"

@implementation HJG_JieDanTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI{

    [self.jiedanBut setTitle:@"完成" forState:0];
    
    self.jubaoBut.alpha = 0.f;
}



@end
