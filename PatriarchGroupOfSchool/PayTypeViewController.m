//
//  PayTypeViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "PayTypeViewController.h"

@interface PayTypeViewController ()

@end

@implementation PayTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"选择支付方式"];
    [self navBarbackButton:nil];
    [self UISetting];
//    [self setFontWithLabels];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)UISetting{
    NSString *contentString = @"打赏600元给导师，在结算之前，平台代为托管";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:contentString];
    
    [string addAttribute:NSForegroundColorAttributeName value:kRedColor range:NSMakeRange(2, 4)];
    
    _labelTItle.attributedText = string;
    
}

- (void)setFontWithLabels{
    _label1.font = _label2.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _labelTItle.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _labelTip.font = _labelPhone.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
}

#pragma mark - 支付方式点击

- (IBAction)payTypeButtonClick:(UIButton *)sender {
    if (sender.tag == 101) {//支付宝
        
    }else{//微信
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"paySuccess" object:nil];
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
