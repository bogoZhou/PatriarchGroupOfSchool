//
//  FilePrivatelyViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/12.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FilePrivatelyViewController.h"
#import "FileCell.h"

#define kCellName @"FileCell"

@interface FilePrivatelyViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FilePrivatelyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}

- (void)UISetting{
    [_tableView registerClass:[FileCell class] forCellReuseIdentifier:kCellName];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FileCell *cell = (FileCell *)[tableView dequeueReusableCellWithIdentifier:kCellName];
    if (!cell) {
        cell = [[FileCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellName];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell showDataWithModel];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = kf2f2f2;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 82;
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
