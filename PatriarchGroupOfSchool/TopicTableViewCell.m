//
//  TopicTableViewCell.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "TopicTableViewCell.h"

@implementation TopicTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    _labelTip.layer.masksToBounds = YES;
    _labelTip.layer.cornerRadius = _labelTip.sizeHeight/2;
    
//    _labelTip.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeVerySmall];
//    _labelContent.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
//    _labelTitle.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
//    _labelTemporary.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
