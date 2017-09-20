//
//  EliteViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "EliteViewController.h"
#import "ChatTopicDetailCell.h"

#define kCell   @"ChatTopicDetailCell"

@interface EliteViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation EliteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}

- (void)UISetting{
    [self creatTableView];
    [_tableView registerClass:[ChatTopicDetailCell class] forCellReuseIdentifier:kCell];
}

- (void)creatTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height - 49 - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}


#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ChatTopicDetailCell *cell  =(ChatTopicDetailCell *)[tableView dequeueReusableCellWithIdentifier:kCell];
    if (!cell) {
        cell = [[ChatTopicDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell showDataWithModel];
    [cell.contentView setBackgroundColor:kColorFrom0x(0xfafafa)];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = kf2f2f2;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    ChatTopicDetailCell *cell = (ChatTopicDetailCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return [cell heigth];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
