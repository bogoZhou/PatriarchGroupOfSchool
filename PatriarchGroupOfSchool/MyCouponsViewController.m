//
//  MyCouponsViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "MyCouponsViewController.h"
#import "MyCouponsTableViewCell.h"
#import "MyCouponsTableViewCell2.h"

#define kCellName @"MyCouponsTableViewCell"
#define kCellName2 @"MyCouponsTableViewCell2"


@interface MyCouponsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation MyCouponsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"我的优惠券(10)"];
    [self navBarbackButton:nil];
    
    _dataArray = @[@"1",@"1",@"1",@"1",@"2",@"2"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - tabelViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_dataArray[indexPath.row] integerValue] == 1) {
        MyCouponsTableViewCell *cell = (MyCouponsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellName];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;
        return  cell;
    }else{
        MyCouponsTableViewCell2 *cell = (MyCouponsTableViewCell2 *)[tableView dequeueReusableCellWithIdentifier:kCellName2];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = kf2f2f2;
        return  cell;
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
