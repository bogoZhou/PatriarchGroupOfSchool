//
//  MineViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "MineViewController.h"
#import "MyCouponsViewController.h"
#import "AboutUsViewController.h"
#import "MyCollectionCampViewController.h"
#import "OpenFailureViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.navigationController.navigationBar.layer.masksToBounds = NO;
//
//    self.navigationController.navigationBar.layer.shadowColor = kBlackColor.CGColor;// 阴影的颜色
//    self.navigationController.navigationBar.layer.shadowOpacity = 0.1;// 阴影透明度
//    self.navigationController.navigationBar.layer.shadowRadius = 2.f;// 阴影扩散的范围控制
//    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(-5, -3);// 阴影的范围
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)UISetting{
    _layoutWidth.constant = kScreenSize.width;
    _layoutHeight.constant = 380;
//    [self setFontWithLabels];
}

- (void)setFontWithLabels{
    _labelTitle.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeVeryLarge];
    _labelName.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _labelContent.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    
    _labelTrampCountLeft.font = _labelTrampCount.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
    
    _labelPassedLeft.font = _labelPassed.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
    
    _labelQuanCountLeft.font = _labelQuanCount.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];

    _labelGuanyuLeft.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
}




#pragma mark - 点击事件

//点击顶部按钮
- (IBAction)topButtonClick:(UIButton *)sender {
}


/**
 点击四个item 
 
 101 -> 我收藏的训练营
 102 -> 申请开班
 103 -> 优惠券
 104 -> 关于我们

 */
- (IBAction)fourButtonClick:(UIButton *)sender {
    UIStoryboard *storyboard = kPublicStroyboard;
    if(sender.tag == 101) {//我收藏的训练营
        MyCollectionCampViewController *myCollectionVC = [storyboard instantiateViewControllerWithIdentifier:@"MyCollectionCampViewController"];
        myCollectionVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myCollectionVC animated:YES];
    }else if (sender.tag == 102){//申请开班
        OpenFailureViewController *openFailureVC = [storyboard instantiateViewControllerWithIdentifier:@"OpenFailureViewController"];
        openFailureVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:openFailureVC animated:YES];
    }else if (sender.tag == 103){//优惠券
        MyCouponsViewController *myCouponsVC = [storyboard instantiateViewControllerWithIdentifier:@"MyCouponsViewController"];
        myCouponsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myCouponsVC animated:YES];
    }else{//关于我们
        AboutUsViewController *aboutUsVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
        aboutUsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:aboutUsVC animated:YES];
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
