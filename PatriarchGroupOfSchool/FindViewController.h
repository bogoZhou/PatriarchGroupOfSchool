//
//  FindViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface FindViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UIView *viewFind;

@property (strong, nonatomic) IBOutlet UILabel *labelCity;

@property (strong, nonatomic) IBOutlet UILabel *labelContent;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *viewScrollView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutWidth;

@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@end
