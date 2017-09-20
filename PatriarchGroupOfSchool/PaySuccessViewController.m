//
//  PaySuccessViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "PaySuccessViewController.h"

@interface PaySuccessViewController ()
{
    CGRect _viewFrame;
}
@end

@implementation PaySuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
    
    _viewFrame = _deepView.frame;
    _deepView.frame = CGRectMake(_viewFrame.origin.x,kScreenSize.height, _viewFrame.size.width, _viewFrame.size.height);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:0.3 animations:^{
        _deepView.frame = _viewFrame;
    }];
}




- (void)UISetting{
    _buttonSure.layer.masksToBounds = YES;
    _buttonSure.layer.cornerRadius = 4;
    
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_buttonSure.frame.size];
    _buttonSure.backgroundColor = [UIColor colorWithPatternImage:image];
//    [self setFontWithLabels];
}

- (void)setFontWithLabels{
    _label1.font = _label2.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _label3.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
    _buttonSure.titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
}

#pragma mark - 点击事件
//返回
- (IBAction)backButtonClick:(UIButton *)sender {
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.5;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = kCATransitionFade;
//    animation.subtype = kCATransitionFromLeft;
//    [self.view.window.layer addAnimation:animation forKey:nil];
    [UIView animateWithDuration:0.3 animations:^{
        _deepView.frame = CGRectMake(_viewFrame.origin.x,kScreenSize.height, _viewFrame.size.width, _viewFrame.size.height);
        
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

//前往训练营
- (IBAction)sureButtonClick:(UIButton *)sender {
//    kAlert(@"走起");
    
    [UIView animateWithDuration:0.3 animations:^{
        _deepView.frame = CGRectMake(_viewFrame.origin.x,kScreenSize.height, _viewFrame.size.width, _viewFrame.size.height);
        
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
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
