//
//  BorderHelper.m
//  Qian
//
//  Created by 周博 on 17/2/8.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BorderHelper.h"

static BorderHelper * defaultManager = nil;

@implementation BorderHelper

+ (void)setLoginViewBorderColor:(UIColor *)color target:(UIView *)target borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat )cornerRadius{
    target.layer.masksToBounds = YES;
    target.layer.borderColor = [color CGColor];
    target.layer.borderWidth = borderWidth;
    target.layer.cornerRadius = cornerRadius;
}

+ (void)setLoginButtonLayerWithCornerRadius:(CGFloat )cornerRadius targetBackgroundColor:(UIColor *)targetBackgroundColor alpha:(CGFloat )alpha target:(UIButton *)target{
    target.layer.masksToBounds = YES;
    target.layer.cornerRadius = cornerRadius;
    target.backgroundColor = [targetBackgroundColor colorWithAlphaComponent:alpha];
}

+ (void)importGoodPageButtonStyleByCornerRadius:(CGFloat)cornerRadius targetBackgroundColor:(UIColor *)targetBackgroundColor textColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth target:(UIButton *)target{
    target.layer.masksToBounds = YES;
    target.layer.borderWidth = borderWidth;
    target.layer.borderColor = [borderColor CGColor];
    target.layer.cornerRadius = cornerRadius;
    target.backgroundColor = targetBackgroundColor;
//    target.tintColor = textColor;
    [target setTitleColor:textColor forState:UIControlStateNormal];

}

+ (void)viewHarfCornerRadiusByView:(UIView *)view{
    view.backgroundColor = [kWhiteColor colorWithAlphaComponent:0.3];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = view.sizeWidth/2;
}

@end
