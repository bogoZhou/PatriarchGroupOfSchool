//
//  OpenCampViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface OpenCampViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UILabel *label1;

@property (strong, nonatomic) IBOutlet UILabel *label2;

@property (strong, nonatomic) IBOutlet UILabel *labelLevel;

@property (strong, nonatomic) IBOutlet UIButton *buttonBoy;

@property (strong, nonatomic) IBOutlet UIButton *buttonGirl;

@property (strong, nonatomic) IBOutlet UIView *viewSchool;

@property (strong, nonatomic) IBOutlet UITextField *textFieldSchool;

@property (strong, nonatomic) IBOutlet UIButton *buttonSure;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutWidth;
@end
