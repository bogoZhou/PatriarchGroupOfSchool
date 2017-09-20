//
//  ChatTopViewCell.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "ChatTopViewCell.h"

@implementation ChatTopViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
}


- (void)showDataWithModel{
    NSString *string = @"只保留7日内的话题";
    
    CGSize titleSize = [string boundingRectWithSize:CGSizeMake(kScreenSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:12]} context:nil].size;

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((kScreenSize.width - titleSize.width - 50)/2, 15, titleSize.width + 50, 36)];
    label.font = [UIFont fontWithName:kPingFangRegularName size:12];
    label.textColor = kWhiteColor;
    label.text = string;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [kBlackColor colorWithAlphaComponent:0.2];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 4;
    
    [self addSubview:label];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
