//
//  EmployeeBaseTabbarViewController.m
//  AccManage
//
//  Created by 周博 on 2017/7/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "EmployeeBaseTabbarViewController.h"

@interface EmployeeBaseTabbarViewController ()

@end

@implementation EmployeeBaseTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.barTintColor = kWhiteColor;
    self.tabBar.tintColor = kRedColor;
    self.tabBar.unselectedItemTintColor = [kBlackColor colorWithAlphaComponent:0.5];
    [self tabbarChooseImageSetting];
    [self tabbarUnchooseImageSetting];
    
    // 去除顶部横线
    [self.tabBar setClipsToBounds:YES];
    self.tabBar.opaque = YES;
}

- (void)tabbarChooseImageSetting{
    UIImage *item0 = [UIImage imageNamed:@"xunlianyinged"];
    item0 = [item0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem0 = [self.tabBar.items objectAtIndex:0];
    homeItem0.selectedImage = item0;
    
    UIImage *item1 = [UIImage imageNamed:@"finded"];
    item1 = [item1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem1 = [self.tabBar.items objectAtIndex:1];
    homeItem1.selectedImage = item1;
    
    UIImage *item2 = [UIImage imageNamed:@"prizeed"];
    item2 = [item2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem2 = [self.tabBar.items objectAtIndex:2];
    homeItem2.selectedImage = item2;
    
    UIImage *item3 = [UIImage imageNamed:@"myed"];
    item3 = [item3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem3 = [self.tabBar.items objectAtIndex:3];
    homeItem3.selectedImage = item3;
}

- (void)tabbarUnchooseImageSetting{
    UIImage *item0 = [UIImage imageNamed:@"xunlianying"];
    item0 = [item0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem0 = [self.tabBar.items objectAtIndex:0];
    homeItem0.image = item0;
    
    UIImage *item1 = [UIImage imageNamed:@"find"];
    item1 = [item1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem1 = [self.tabBar.items objectAtIndex:1];
    homeItem1.image = item1;
    
    UIImage *item2 = [UIImage imageNamed:@"prize"];
    item2 = [item2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem2 = [self.tabBar.items objectAtIndex:2];
    homeItem2.image = item2;
    
    UIImage *item3 = [UIImage imageNamed:@"my"];
    item3 = [item3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeItem3 = [self.tabBar.items objectAtIndex:3];
    homeItem3.image = item3;
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
