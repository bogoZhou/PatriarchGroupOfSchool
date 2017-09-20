//
//  TopicPutSuccessViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/14.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "TopicPutSuccessViewController.h"

@interface TopicPutSuccessViewController ()

@end

@implementation TopicPutSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navBarTitle:@"发起一个新的话题"];
    [self navBarbackButton:nil];
    
    [self UISetting];
}

- (void)UISetting{
    _buttonSuccess.layer.masksToBounds = YES;
    _buttonSuccess.layer.cornerRadius = 4;
    
    _label1.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _buttonSuccess.titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
}


- (void)backLastPage{
    [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count - 3] animated:YES];
}


- (IBAction)successButtonClick:(UIButton *)sender {
    [self backLastPage];
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
