//
//  MyCollectionCampViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "MyCollectionCampViewController.h"
#import "MyCollectionCampCell.h"

#define kCellName @"MyCollectionCampCell"

@interface MyCollectionCampViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MyCollectionCampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"我收藏的训练营(10)"];
    [self navBarbackButton:nil];
    [self UISetting];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.layer.masksToBounds = NO;
//    
//    self.navigationController.navigationBar.layer.shadowColor = kBlackColor.CGColor;// 阴影的颜色
//    self.navigationController.navigationBar.layer.shadowOpacity = 0.1;// 阴影透明度
//    self.navigationController.navigationBar.layer.shadowRadius = 3.f;// 阴影扩散的范围控制
//    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(-5, -3);// 阴影的范围

}

- (void)UISetting{
    [_tableView registerClass:[MyCollectionCampCell class] forCellReuseIdentifier:kCellName];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionCampCell *cell = (MyCollectionCampCell *)[tableView dequeueReusableCellWithIdentifier:kCellName];
    
    if (!cell) {
        cell = [[MyCollectionCampCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellName];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell showDataWithModel];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = kf2f2f2;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionCampCell *cell = (MyCollectionCampCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return [cell height];
}

#pragma mark - 编辑删除按钮

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"取消收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //        kAlert(@"点击了删除")
        [_tableView reloadData];
    }];
    deleteAction.backgroundColor = kYellowColor;
//    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"lalala" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        //        kAlert(@"点击了标记未读");
//    }];
//    editAction.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return @[deleteAction];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    editingStyle = UITableViewCellEditingStyleDelete;
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
