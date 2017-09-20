//
//  BaseViewController.h
//  BusinessAccountingSystem
//
//  Created by 周博 on 2017/5/2.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,strong) MBProgressHUD *hud;

- (void)UISetting;

- (void)navBarTitle:(NSString *)title;

- (void)clickNavTitle:(UIButton *)button;

- (void)navBarbackButton:(NSString *)title;

- (void)backLastPage;

- (void)creatGestureOnScrollView:(UIScrollView *)scrollView;

- (void)rightButtonImage:(UIImage *)image;
- (void)rightButtonClickWithString:(NSString *)string;


- (void)rightNavButtonClick;

- (void)alertVCByTitle:(NSString *)title isBack:(BOOL)isBack;

- (void)showHudWithView:(UIView *)view title:(NSString *)title;

- (void)hiddenHud;

@end
