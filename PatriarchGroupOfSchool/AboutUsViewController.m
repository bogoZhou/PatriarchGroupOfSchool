//
//  AboutUsViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AddNewTopicViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"设置"];
    [self navBarbackButton:nil];
//    [self setFontWithLabels];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)setFontWithLabels{
   _labelVerson.font = _label1.font = _label2.font = _label3.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
}

#pragma mark - 点击事件


/**
 点击items
 101 -> 去评分
 102 -> 关于名校家长圈
 103 -> 退出登录
 */
- (IBAction)itemsButtonClick:(UIButton *)sender {
    UIStoryboard *storyboard = kPublicStroyboard;
    if (sender.tag == 101) {
        kAlert(@"去评分");

    }else if (sender.tag == 102){
        kAlert(@"关于名校家长圈");
    }else{
        kAlert(@"退出");
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
