//
//  MineViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface MineViewController : BaseViewController
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutWidth;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutHeight;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewHeader;

@property (strong, nonatomic) IBOutlet UILabel *labelName;

@property (strong, nonatomic) IBOutlet UILabel *labelContent;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewV;

@property (strong, nonatomic) IBOutlet UILabel *labelTrampCountLeft;
@property (strong, nonatomic) IBOutlet UILabel *labelTrampCount;

@property (strong, nonatomic) IBOutlet UILabel *labelPassedLeft;
@property (strong, nonatomic) IBOutlet UILabel *labelPassed;

@property (strong, nonatomic) IBOutlet UILabel *labelQuanCountLeft;
@property (strong, nonatomic) IBOutlet UILabel *labelQuanCount;

@property (strong, nonatomic) IBOutlet UILabel *labelGuanyuLeft;
@end
