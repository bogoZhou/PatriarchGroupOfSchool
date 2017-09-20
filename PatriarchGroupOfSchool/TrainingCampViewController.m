//
//  TrainingCampViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "TrainingCampViewController.h"
#import "TrainingCampTableViewCell.h"
#import "TopicTableViewCell.h"
#import "TrainingCampDetailViewController.h"

#define kTrainingCampCell @"TrainingCampTableViewCell"
#define kTopicCell @"TopicTableViewCell"

@interface TrainingCampViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation TrainingCampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)UISetting{
    _dataArray = @[@"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4"];
//    _labelTitle.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeVeryLarge];
}







#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *indexString = _dataArray[indexPath.row];
    
    if (indexString.integerValue == 1) {
        TrainingCampTableViewCell *cell = (TrainingCampTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTrainingCampCell];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;

        
        return cell;
    }else{
        TopicTableViewCell *cell = (TopicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTopicCell];
        if (indexString.integerValue == 2) {
            cell.labelTemporary.text = @"[临时私聊]";
        }else if (indexString.integerValue == 3){
            cell.labelTemporary.text = @"[私聊]";
        }else{
            cell.labelTemporary.text = @"";
        }
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = kPublicStroyboard;
    TrainingCampDetailViewController *trainDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"TrainingCampDetailViewController"];
    trainDetailVC.hidesBottomBarWhenPushed = YES;
    trainDetailVC.titleString = @"大烧波的训练营";
    [self.navigationController pushViewController:trainDetailVC animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
