//
//  LQLiveListViewController.m
//  LQIJKMediaFrameDemo
//
//  Created by liqi on 16/9/7.
//  Copyright © 2016年 liqi. All rights reserved.
/*
   直播列表
 
 */
//

#import "LQLiveListViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "LQLiveCell.h"
#import "LQListDetailViewController.h"
#import "LQLiveItem.h"
//映客数据
#define kUrlStr  @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1"

#define kUserId  @"liveCell"
@interface LQLiveListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LQLiveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"直播列表";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self requestDate];
    [self.tableView registerNib:[UINib nibWithNibName:@"LQLiveCell" bundle:nil] forCellReuseIdentifier:kUserId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)requestDate {
    
    AFHTTPSessionManager *messager = [AFHTTPSessionManager manager];
    messager.responseSerializer = [AFJSONResponseSerializer serializer];
    messager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",nil];
    [messager GET:kUrlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject = %@",responseObject);
        self.dataArray = [LQLiveItem mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
            [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error = %@",error);
        
    }];
  
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 430;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //liveCell
    static NSString * userId = kUserId;
    
    LQLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:userId];
    if (!cell) {
        cell = [[LQLiveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userId];
    }
    cell.item = self.dataArray[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LQLiveCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.item = self.dataArray[indexPath.row];
    LQListDetailViewController *ldc = [[LQListDetailViewController alloc] init];
    
    ldc.item = cell.item;
    [self.navigationController pushViewController:ldc animated:YES];
    
    
}

#pragma  mark - 懒加载

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    
    return _tableView;
}


@end
