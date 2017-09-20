//
//  PayMoneyViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "PayMoneyViewController.h"
#import "PayTypeViewController.h"

@interface PayMoneyViewController ()
{
    NSString *_moneyString;
    CGRect _viewFrame;
}
@end

@implementation PayMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}


- (void)UISetting{
    [self resetBorders];
    [self chooseBorderByTag:102];
    
    _buttonNextStept.layer.masksToBounds = YES;
    _buttonNextStept.layer.cornerRadius = 4;
//    [self setFontWithLabels];
    
    _viewFrame = _deepView.frame;
    _deepView.frame = CGRectMake(_viewFrame.origin.x,kScreenSize.height, _viewFrame.size.width, _viewFrame.size.height);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        _deepView.frame = _viewFrame;
    }];
    
}

- (void)setFontWithLabels{
//    @property (strong, nonatomic) IBOutlet UILabel *labelMoney1;
//    @property (strong, nonatomic) IBOutlet UILabel *labelDate1;
//    @property (strong, nonatomic) IBOutlet UILabel *labelMany;
    
    _labelMany.font = _labelMany2.font = _labelMany3.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _labelMoney1.font = _labelMoney2.font = _labelMoney3.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _labelDate1.font = _labelDate2.font = _labelDate3.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _buttonNextStept.titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
}

- (void)resetBorders{
    [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_view1 borderWidth:1 cornerRadius:_view1.sizeHeight/2];
    [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_view2 borderWidth:1 cornerRadius:_view2.sizeHeight/2];
    [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_view3 borderWidth:1 cornerRadius:_view3.sizeHeight/2];
    
    _view1.backgroundColor = kWhiteColor;
    _labelMoney1.textColor = kBlackColor;
    _labelDate1.textColor = kBlackColor;
    _labelMany.textColor = kBlackColor;
    
    _view2.backgroundColor = kWhiteColor;
    _labelMoney2.textColor = kBlackColor;
    _labelDate2.textColor = kBlackColor;
    _labelMany2.textColor = kBlackColor;
    
    _view3.backgroundColor = kWhiteColor;
    _labelMoney3.textColor = kBlackColor;
    _labelDate3.textColor = kBlackColor;
    _labelMany3.textColor = kBlackColor;
    
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_buttonNextStept.frame.size];
    _buttonNextStept.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void)chooseBorderByTag:(NSInteger)tag{
    
    if (tag == 101) {
        
        [BorderHelper setLoginViewBorderColor:kGreenColor target:_view1 borderWidth:1 cornerRadius:_view1.sizeHeight/2];
        _view1.backgroundColor = kGreenColor;
        _labelMoney1.textColor = kWhiteColor;
        _labelDate1.textColor = kWhiteColor;
        _labelMany.textColor = kWhiteColor;
        
        _labelMany2.textColor = kGreenColor;

        
    }else if (tag == 102){
        [BorderHelper setLoginViewBorderColor:kGreenColor target:_view2 borderWidth:1 cornerRadius:_view2.sizeHeight/2];

        _view2.backgroundColor = kGreenColor;
        _labelMoney2.textColor = kWhiteColor;
        _labelDate2.textColor = kWhiteColor;
        _labelMany2.textColor = kWhiteColor;
    }else if (tag == 103){
        [BorderHelper setLoginViewBorderColor:kGreenColor target:_view3 borderWidth:1 cornerRadius:_view3.sizeHeight/2];

        _view3.backgroundColor = kGreenColor;
        _labelMoney3.textColor = kWhiteColor;
        _labelDate3.textColor = kWhiteColor;
        _labelMany3.textColor = kWhiteColor;
        
        _labelMany2.textColor = kGreenColor;

    }
    
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
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    
}

//选择items 101 - 103
- (IBAction)chooseItemsButtonClick:(UIButton *)sender {
    [self resetBorders];
    [self chooseBorderByTag:sender.tag];
    if (sender.tag == 101) {
        _moneyString = @"600";
    }else if (sender.tag == 102){
        _moneyString = @"1000";
    }else{
        _moneyString = @"1200";
    }
}

- (IBAction)nextSteptButtonClick:(UIButton *)sender {
    UIStoryboard *storyboard = kModalStroyboard;
    PayTypeViewController *payTypeVC = [storyboard instantiateViewControllerWithIdentifier:@"PayTypeViewController"];
    payTypeVC.moneyString = _moneyString;
    [self.navigationController pushViewController:payTypeVC animated:YES];
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
