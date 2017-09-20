//
//  AddNewTopicViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/1.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface AddNewTopicViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *viewScrollView;

@property (strong, nonatomic) IBOutlet UIView *viewText;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentContrl;

@property (strong, nonatomic) IBOutlet UIButton *buttonSure;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutWidth;

@property (strong, nonatomic) IBOutlet UILabel *label1;


@end
