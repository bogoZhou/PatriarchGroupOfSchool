//
//  LookUserDetailViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/1.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "LookUserDetailViewController.h"
#import "UserHeaderImageView.h"

@interface LookUserDetailViewController ()

@end

@implementation LookUserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:_name];
    [self navBarbackButton:nil];
    [self creatCenterView];
    
    _textFIeldSearch.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
    _buttonSearch.titleLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
}


- (void)creatCenterView{
    UserHeaderImageView *userView = [[UserHeaderImageView alloc] initWithFrame:CGRectMake(0, 60, kScreenSize.width, 100) viewName:_name array:_dataArray isShowAll:YES block:^(CGFloat height) {
        userView.frame = CGRectMake(userView.orginX, userView.orginY, userView.sizeWidth, height);
    }];
    [_viewScrollView addSubview:userView];
    
    _layoutWidth.constant = kScreenSize.width;
    _layoutHeight.constant = userView.allHeight + 10;
    
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
