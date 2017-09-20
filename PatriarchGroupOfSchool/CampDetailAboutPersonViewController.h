//
//  CampDetailAboutPersonViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface CampDetailAboutPersonViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UIView *viewScrollView;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *viewHeaders;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutHeadersViewHeight;

@property (strong, nonatomic) IBOutlet UIView *viewDeepContent;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutWidth;

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label1Right;

@property (strong, nonatomic) IBOutlet UILabel *label2;

@property (strong, nonatomic) IBOutlet UILabel *label3;

@property (strong, nonatomic) IBOutlet UILabel *label3Right;

@property (strong, nonatomic) IBOutlet UILabel *label4;

@property (strong, nonatomic) IBOutlet UILabel *label4Right;
@property (strong, nonatomic) IBOutlet UILabel *lable5;
@property (strong, nonatomic) IBOutlet UILabel *label6;
@property (strong, nonatomic) IBOutlet UILabel *label6Right;

@end
