//
//  MyCouponsTableViewCell.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "MyCouponsTableViewCell.h"

@implementation MyCouponsTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    _viewContent.layer.masksToBounds = YES;
    _viewContent.layer.cornerRadius = 5;
    
    _viewContent.layer.masksToBounds = NO;
    _viewContent.layer.shadowColor = kRedColor.CGColor;// 阴影的颜色
    _viewContent.layer.shadowOpacity = 0.5;// 阴影透明度
    _viewContent.layer.shadowRadius = 5.f;// 阴影扩散的范围控制
    _viewContent.layer.shadowOffset = CGSizeMake(5, 5);// 阴影的范围
    
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_viewContent.frame.size];
    _viewContent.backgroundColor = [UIColor colorWithPatternImage:image];
    
//    _viewContent.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(_viewContent.orginX, _viewContent.orginY, 2, 2)].CGPath;
//    [self setFontWithLabels];
}

- (void)setFontWithLabels{

    _labelName.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeMiddle];
    
    _labelDate.font = _labelLimit.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    
//    _labelMoneyLeft.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeMiddle];
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
