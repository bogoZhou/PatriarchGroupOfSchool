//
//  TopicTableViewCell.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface TopicTableViewCell : BaseTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageViewHeader;

@property (strong, nonatomic) IBOutlet UILabel *labelTip;

@property (strong, nonatomic) IBOutlet UILabel *labelTemporary;

@property (strong, nonatomic) IBOutlet UILabel *labelTitle;

@property (strong, nonatomic) IBOutlet UILabel *labelContent;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *layoutTemporaryWidth;



@end
