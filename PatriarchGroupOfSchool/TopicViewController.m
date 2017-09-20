//
//  TopicViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "TopicViewController.h"
#import "ChatTopViewCell.h"
#import "ChatTopicDetailCell.h"

#define kCell1 @"ChatTopViewCell"
#define kCell2 @"ChatTopicDetailCell"

@interface TopicViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}

- (void)UISetting{
    [_tableView registerClass:[ChatTopViewCell class] forCellReuseIdentifier:kCell1];
    [_tableView registerClass:[ChatTopicDetailCell class] forCellReuseIdentifier:kCell2];
}


#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ChatTopViewCell *cell  =(ChatTopViewCell *)[tableView dequeueReusableCellWithIdentifier:kCell1];
        if (!cell) {
            cell = [[ChatTopViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell showDataWithModel];
        [cell.contentView setBackgroundColor:kColorFrom0x(0xfafafa)];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;
        return cell;
    }else{
        ChatTopicDetailCell *cell  =(ChatTopicDetailCell *)[tableView dequeueReusableCellWithIdentifier:kCell2];
        if (!cell) {
            cell = [[ChatTopicDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell2];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell showDataWithModel];
        [cell.contentView setBackgroundColor:kColorFrom0x(0xfafafa)];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 55;
    }else{
        ChatTopicDetailCell *cell = (ChatTopicDetailCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return [cell heigth];
    }
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
