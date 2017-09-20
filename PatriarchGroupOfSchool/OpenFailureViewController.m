//
//  OpenFailureViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "OpenFailureViewController.h"
#import "OpenCampViewController.h"

@interface OpenFailureViewController ()

@end

@implementation OpenFailureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
    [self navBarTitle:@"申请开办训练营"];
    [self navBarbackButton:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)UISetting{
    _buttonSure.layer.masksToBounds = YES;
    _buttonSure.layer.cornerRadius = 4;
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_buttonSure.frame.size];
    _buttonSure.backgroundColor = [UIColor colorWithPatternImage:image];
    
//    _buttonSure.titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
//    _label1.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
//    _label2.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    
}

- (IBAction)sureButtonClick:(UIButton *)sender {
    UIStoryboard *storyboard = kPublicStroyboard;
    OpenCampViewController *openCampVC = [storyboard instantiateViewControllerWithIdentifier:@"OpenCampViewController"];
    [self.navigationController pushViewController:openCampVC animated:YES];
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
