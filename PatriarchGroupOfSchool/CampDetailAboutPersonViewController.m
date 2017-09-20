//
//  CampDetailAboutPersonViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "CampDetailAboutPersonViewController.h"
#import "UserHeaderImageView.h"

@interface CampDetailAboutPersonViewController ()

@end

@implementation CampDetailAboutPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"烧波的训练营"];
    [self navBarbackButton:nil];
//    [self UISetting];
    [self creatTopView];
}

- (void)UISetting{
    _layoutWidth.constant = kScreenSize.width;
    _layoutHeight.constant = _viewDeepContent.sizeHeight + _layoutHeadersViewHeight.constant + 15;
//    [self setFontWithLabels];
}

- (void)setFontWithLabels{
    _label1.font = _label2.font = _label3.font = _label4.font = _lable5.font = _label6.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    
    _label1Right.font = _label3Right.font = _label4Right.font = _label6Right.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
}


- (void)creatTopView{
    NSArray *array1 = @[@"1"];
    NSArray *array2 = @[@"1",@"1",@"1"];
    NSArray *array3 = @[@"1",@"1",@"1",@"1",@"1",@"1"];
    NSArray *array4 = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];


    UserHeaderImageView *userView = [[UserHeaderImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 100) viewName:@"导师" array:array1 isShowAll:NO block:^(CGFloat height) {
        userView.frame = CGRectMake(userView.orginX, userView.orginY, userView.sizeWidth, height);
    }];
    [_viewHeaders addSubview:userView];
    
    UserHeaderImageView *userView2 = [[UserHeaderImageView alloc] initWithFrame:CGRectMake(0, userView.allHeight, kScreenSize.width, 100) viewName:@"管理员" array:array3 isShowAll:NO block:^(CGFloat height) {
        userView.frame = CGRectMake(userView2.orginX, userView2.orginY, userView2.sizeWidth, height);
    }];
    [_viewHeaders addSubview:userView2];
    
    UserHeaderImageView *userView3 = [[UserHeaderImageView alloc] initWithFrame:CGRectMake(0, userView2.allHeight, kScreenSize.width, 100) viewName:@"平台观察员" array:array1 isShowAll:NO block:^(CGFloat height) {
        userView.frame = CGRectMake(userView3.orginX, userView3.orginY, userView3.sizeWidth, height);
    }];
    [_viewHeaders addSubview:userView3];
    
    UserHeaderImageView *userView4 = [[UserHeaderImageView alloc] initWithFrame:CGRectMake(0, userView3.allHeight, kScreenSize.width, 100) viewName:@"成员家长" array:array4 isShowAll:NO block:^(CGFloat height) {
        userView.frame = CGRectMake(userView4.orginX, userView4.orginY, userView4.sizeWidth, height);
    }];
    [_viewHeaders addSubview:userView4];
    
    _layoutHeadersViewHeight.constant = userView4.allHeight;
    [self UISetting];
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
