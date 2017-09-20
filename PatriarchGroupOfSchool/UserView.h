//
//  UserView.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseView.h"

@interface UserView : BaseView

@property (strong, nonatomic)  UIImageView *imageViewHeader;

@property (strong, nonatomic)  UILabel *labelName;

@property (strong, nonatomic)  UIImageView *imageViewVIP;

@property (strong, nonatomic)  UILabel *labelContent;

@property (strong, nonatomic)  UIView *viewStar;

@property (strong, nonatomic)  UILabel *labelMoneyOrStarLevel;

@property (strong, nonatomic)  UIView *viewLabels;

@end
