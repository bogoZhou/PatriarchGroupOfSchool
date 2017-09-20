//
//  OpenSuccessViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "OpenSuccessViewController.h"

@interface OpenSuccessViewController ()

@end

@implementation OpenSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"申请开办训练营"];
    [self navBarbackButton:nil];
    [self UISetting];
}

- (void)UISetting{
    _buttonSure.layer.masksToBounds = YES;
    _buttonSure.layer.cornerRadius = 4;
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_buttonSure.frame.size];
    _buttonSure.backgroundColor = [UIColor colorWithPatternImage:image];
//    [self setFontWithLabels];
}

- (void)setFontWithLabels{
    _label1.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _label2.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _buttonSure.titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
}


//点击完成
- (IBAction)sureButtonClick:(UIButton *)sender {
    [self backLastPage];
}

- (void)backLastPage{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
