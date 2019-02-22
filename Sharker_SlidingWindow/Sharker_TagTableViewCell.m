//
//  Sharker_TagTableViewCell.m
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "Sharker_TagTableViewCell.h"
#import "Masonry.h"
@interface Sharker_TagTableViewCell()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *localImageView;
@property (nonatomic,strong) UILabel *localLabel;
@property (nonatomic,strong) UIImageView *pathImageView;
@property (nonatomic,strong) UILabel *pathLabel;
@property (nonatomic,strong) UIButton *goBtn;
@property (nonatomic,copy) NSArray *array;

@end

@implementation Sharker_TagTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    _goBtn = [[UIButton alloc] init];
    _goBtn.backgroundColor = UIColor.cyanColor;
    _goBtn.layer.cornerRadius = _goBtn.frame.size.width/2;
    [self addSubview:_goBtn];
    [_goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.width.height.equalTo(@80);
    }];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _dataDic[@"title"];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = UIColor.blackColor;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).mas_offset(30);
        make.top.equalTo(self.contentView).mas_offset(30);
        make.right.equalTo(self.goBtn.mas_left).mas_offset(10);
    }];
    
    _localImageView = [[UIImageView alloc] init];
    _localImageView.image = [UIImage imageNamed:_dataDic[@"icon_local"]];
    [self addSubview:_localImageView];
    [_localImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(10);
        make.width.height.mas_offset(30);
    }];
    
    _localLabel = [[UILabel alloc] init];
    _localLabel.text = _dataDic[@"local"];
    _localLabel.font = [UIFont systemFontOfSize:8];
    _localLabel.textColor = UIColor.blackColor;
    [self addSubview:_localLabel];
    [_localLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.localLabel);
        make.left.equalTo(self.localLabel).mas_offset(5);
    }];
    
    _pathImageView = [[UIImageView alloc] init];
    _pathImageView.image = [UIImage imageNamed:_dataDic[@"icon_path"]];
    [self addSubview:_pathImageView];
    [_pathImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.localLabel.mas_top);
        make.left.equalTo(self.localLabel.mas_right).offset(20);
        make.width.height.mas_offset(30);
    }];
    
    _pathLabel = [[UILabel alloc] init];
    _pathLabel.textColor = UIColor.blackColor;
    _pathLabel.font = [UIFont systemFontOfSize:8];
    _pathLabel.text = _dataDic[@"path"];
    [self addSubview:_pathLabel];
    [_pathLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pathImageView.mas_top);
        make.left.equalTo(self.pathImageView.mas_right).mas_offset(5);
    }];
    
    
    
    
    
    
    
    
}

@end
