//
//  PayTypeViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface PayTypeViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UILabel *labelTItle;

@property (strong, nonatomic) IBOutlet UILabel *labelTip;

@property (strong, nonatomic) IBOutlet UILabel *labelPhone;

@property (nonatomic,strong) NSString *moneyString;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;

@end
