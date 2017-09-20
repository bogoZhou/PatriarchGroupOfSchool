//
//  OpenCampViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "OpenCampViewController.h"
#import "OpenSuccessViewController.h"
#import "SearchViewController.h"

@interface OpenCampViewController ()<SearchViewControllerDelegate>

@end

@implementation OpenCampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
    [self navBarTitle:@"申请开办训练营"];
    [self navBarbackButton:nil];
    [self creatGestureOnScrollView:_scrollView];
    [self chooseSexButtonClick:_buttonBoy];
}

- (void)UISetting{
    _layoutWidth.constant = kScreenSize.width;
    _layoutHeight.constant = 460;
    
    [BorderHelper importGoodPageButtonStyleByCornerRadius:_buttonBoy.sizeHeight/2 targetBackgroundColor:kWhiteColor textColor:kBlackColor borderColor:ke6e6e6 borderWidth:1 target:_buttonBoy];
    [BorderHelper importGoodPageButtonStyleByCornerRadius:_buttonGirl.sizeHeight/2 targetBackgroundColor:kWhiteColor textColor:kBlackColor borderColor:ke6e6e6 borderWidth:1 target:_buttonGirl];
    
    [BorderHelper setLoginViewBorderColor:kGreenColor target:_viewSchool borderWidth:1 cornerRadius:4];
    
    _buttonSure.layer.masksToBounds = YES;
    _buttonSure.layer.cornerRadius = 4;
    
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_buttonSure.frame.size];
    _buttonSure.backgroundColor = [UIColor colorWithPatternImage:image];
//    [self setFontWithLabels];
}

- (void)setFontWithLabels{
    _label1.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _label2.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _labelLevel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeLarge];
    
    _buttonBoy.titleLabel.font = _buttonGirl.titleLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _buttonSure.titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    _textFieldSchool.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
}






#pragma mark - 点击事件

//201 -> sub ; 202 -> add
- (IBAction)subAndAddButtonClick:(UIButton *)sender {
    if (sender.tag == 201) {
        kAlert(@"麻痹,降级");
    }else{
        kAlert(@"升学");
    }
}

//选择性别
//101 -> 男 ; 102 -> 女
- (IBAction)chooseSexButtonClick:(UIButton *)sender {
    if (sender.tag == 101) {
        [BorderHelper importGoodPageButtonStyleByCornerRadius:_buttonBoy.sizeHeight/2 targetBackgroundColor:kGreenColor textColor:kWhiteColor borderColor:kGreenColor borderWidth:1 target:_buttonBoy];
        [BorderHelper importGoodPageButtonStyleByCornerRadius:_buttonGirl.sizeHeight/2 targetBackgroundColor:kWhiteColor textColor:kBlackColor borderColor:ke6e6e6 borderWidth:1 target:_buttonGirl];
    }else{
        [BorderHelper importGoodPageButtonStyleByCornerRadius:_buttonBoy.sizeHeight/2 targetBackgroundColor:kWhiteColor textColor:kBlackColor borderColor:ke6e6e6 borderWidth:1 target:_buttonBoy];
        [BorderHelper importGoodPageButtonStyleByCornerRadius:_buttonGirl.sizeHeight/2 targetBackgroundColor:kGreenColor textColor:kWhiteColor borderColor:kGreenColor borderWidth:1 target:_buttonGirl];
    }
}

//提交申请
- (IBAction)sendButtonClick:(UIButton *)sender {
    UIStoryboard *storyboard = kPublicStroyboard;
    OpenSuccessViewController *openSuccessVC = [storyboard instantiateViewControllerWithIdentifier:@"OpenSuccessViewController"];
    [self.navigationController pushViewController:openSuccessVC animated:YES];
}

//选择学校
- (IBAction)chooseSchoolButtonClick:(UIButton *)sender {
    UIStoryboard *storyboard = kPublicStroyboard;
    
    SearchViewController *searchVC = [storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    searchVC.delegate = self;
    searchVC.fromId = @"1";
    [self.navigationController pushViewController:searchVC animated:YES];
}


- (void)backLastPage{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - 选择学校代理方法

- (void)sendValueWithNameToChooseSchool:(NSString *)schoolName{
    _textFieldSchool.text = schoolName;
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
