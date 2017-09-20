//
//  MyCouponsTableViewCell2.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/14.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface MyCouponsTableViewCell2 : BaseTableViewCell

@property (strong, nonatomic) IBOutlet UIView *viewContent;

@property (strong, nonatomic) IBOutlet UILabel *labelName;

@property (strong, nonatomic) IBOutlet UILabel *labelDate;

@property (strong, nonatomic) IBOutlet UILabel *labelLimit;

@property (strong, nonatomic) IBOutlet UILabel *labelMoney;

@property (strong, nonatomic) IBOutlet UILabel *labelMoneyLeft;


@end
