//
//  MyCouponsTableViewCell2.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/14.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "MyCouponsTableViewCell2.h"

@implementation MyCouponsTableViewCell2

- (void)awakeFromNib{
    [super awakeFromNib];
    _viewContent.layer.masksToBounds = YES;
    _viewContent.layer.cornerRadius = 5;
//    [self setFontWithLabels];
}


- (void)setFontWithLabels{
    
    _labelName.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeMiddle];
    
    _labelDate.font = _labelLimit.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    
//    _labelMoneyLeft.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeVeryLarge];
    _labelMoney.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeVeryLarge];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
