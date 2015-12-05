//
//  TabActivityViewController.m
//  Gather
//
//  Created by chen on 11/30/15.
//  Copyright © 2015 chen. All rights reserved.
//

#import "TabActivityViewController.h"
#import "MJRefresh.h"
#import "PublishChooseView.h"
#import "ActivityHeaderScrollView.h"

@interface TabActivityViewController () <UITableViewDataSource, UITableViewDelegate> {
    ActivityHeaderScrollView *headerScrollView;
}

@end

@implementation TabActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动";
    self.navigationController.navigationBar.hidden = YES;
    
    _searchButton.layer.cornerRadius = 3.0;
    _searchButton.clipsToBounds = YES;
    
    _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    headerScrollView = [[ActivityHeaderScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
//    _mainTableView.tableHeaderView = headerScrollView;
    _mainTableView.tableFooterView = [[UIView alloc] init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _mainTableView.tableHeaderView = headerScrollView;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 100;
//}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return [[ActivityHeaderScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

-(void)headerRefresh
{
    [_mainTableView.mj_header endRefreshing];
}

- (IBAction)tapPublishButton:(id)sender {
    PublishChooseView *publishView = [[PublishChooseView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    publishView.alpha = 0.0;
    [self.view.window addSubview:publishView];
    [UIView animateWithDuration:0.5 animations:^{
        publishView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}


@end
