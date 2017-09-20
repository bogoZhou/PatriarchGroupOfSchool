//
//  SearchViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/12.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell1.h"
#import "SearchCell2.h"

#import "FindDetailViewController.h"

#define kCell1 @"SearchCell1"
#define kCell2 @"SearchCell2"


@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"搜索"];
    [self navBarbackButton:nil];
    
    [self UISetting];
}

- (void)UISetting{
    _dataArray = @[@[@"1",@"1",@"1",@"1",@"1"],@[@"2",@"2",@"2"]];
    [self creatGestureOnScrollView:_tableView];
    [_tableView reloadData];
    
    [_textFieldSearch setValue:[kBlackColor colorWithAlphaComponent:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    
//    _textFieldSearch.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
//    _buttonSearch.titleLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
    _buttonSearch.hidden = YES;
    
}

#pragma mark - 输入框值改变


- (IBAction)textFieldValueChanged:(UITextField *)sender {
    if ([BGFunctionHelper isNULLOfString:sender.text]) {
        _buttonSearch.hidden  =YES;
    }else{
        _buttonSearch.hidden = NO;
    }
    
    NSLog(@"%@",sender.text);

}


#pragma mark - 点击事件
//点击搜索
- (IBAction)searchButtonClick:(UIButton *)sender {
    [_textFieldSearch resignFirstResponder];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SearchCell1 *cell = (SearchCell1 *)[tableView dequeueReusableCellWithIdentifier:kCell1];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;
        return cell;
    }else{
        SearchCell2 *cell = (SearchCell2 *)[tableView dequeueReusableCellWithIdentifier:kCell2];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 50;
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 50)];
    headerView.backgroundColor = kWhiteColor;
    
    UILabel *headerLabelName = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, kScreenSize.width - 40, 20)];
    headerLabelName.textColor = kBlackColor;
    headerLabelName.alpha = 0.5;
    headerLabelName.font = [UIFont fontWithName:kPingFangRegularName size:15];
    [headerView addSubview:headerLabelName];
    
    if (section == 0) {
        headerLabelName.text = @"搜索结果";
    }else{
        headerLabelName.text = @"搜索历史";
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    kAlert(@"点击");
    
    if (_fromId.integerValue == 1) {
        [_delegate sendValueWithNameToChooseSchool:@"xx小学"];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIStoryboard *storyboard = kPublicStroyboard;
        FindDetailViewController *findDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"FindDetailViewController"];
        findDetailVC.hidesBottomBarWhenPushed = YES;
        findDetailVC.type = @"1";
        [self.navigationController pushViewController:findDetailVC animated:YES];
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
