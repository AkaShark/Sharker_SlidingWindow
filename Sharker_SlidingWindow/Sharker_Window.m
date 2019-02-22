//
//  Sharker_Window.m
//  Sharker_SlidingWindow
//
//  Created by didi on 2019/2/17.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "Sharker_Window.h"
#import "Sharker_SlidingWindowConfig.h"
#import "Sharker_TagTableViewCell.h"
#import "Sharker_DetailTableViewCell.h"
#import "Sharker_SegmentationTableViewCell.h"

@interface Sharker_Window()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation Sharker_Window

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        self.delegate = self;
    }
    return self;
}

- (void)setupUI{
    Sharker_SlidingWindowConfig *config = [Sharker_SlidingWindowConfig shareConfig];
    self.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    self.contentOffset = CGPointMake(0, -(config.imageHight-config.residueHeight));
    self.contentInset = UIEdgeInsetsMake((config.imageHight-config.residueHeight), 0, 0, 0);
    self.backgroundColor = UIColor.clearColor;
    self.showsVerticalScrollIndicator = NO;
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    self.bounces = NO;
//    设置内容
//    Sharker_ContentView *contentView = [[Sharker_ContentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self addSubview:contentView];
}

#pragma mark- ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y <= 0) {
        if (_offsetBlock)
        {
            _offsetBlock((float)scrollView.contentOffset.y);
        }
    } 
}
#pragma mark- TableViewDelegate
- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        Sharker_TagTableViewCell *cell = [[Sharker_TagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TagCell"];
        return cell;
    }
    else if (indexPath.row == 1){
        Sharker_DetailTableViewCell *cell = [[Sharker_DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailCell"];
        return cell;
    }
    else{
        Sharker_SegmentationTableViewCell *cell = [[Sharker_SegmentationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SegmentationCell"];
        return cell;
    }
    
    
}


@end
