//
//  BorderHelper.h
//  Qian
//
//  Created by 周博 on 17/2/8.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BorderHelper : NSObject

/**
 登录页面 账号密码view
 
 @param color 边框颜色
 @param target 设置边框的对象
 @param borderWidth 边框宽度
 @param cornerRadius 弧度
 */
+ (void)setLoginViewBorderColor:(UIColor *)color target:(UIView *)target borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat )cornerRadius;

/**
 登录页面 登录按钮
 
 @param cornerRadius 边框弧度
 @param targetBackgroundColor 背景颜色
 @param alpha 透明度
 @param target 目标按钮
 */
+ (void)setLoginButtonLayerWithCornerRadius:(CGFloat )cornerRadius targetBackgroundColor:(UIColor *)targetBackgroundColor alpha:(CGFloat )alpha target:(UIButton *)target;


/**
 进件页面 下方按钮

 @param cornerRadius 弧度
 @param targetBackgroundColor 背景
 @param textColor 字体颜色
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 @param target 目标按钮
 */
+ (void)importGoodPageButtonStyleByCornerRadius:(CGFloat)cornerRadius targetBackgroundColor:(UIColor *)targetBackgroundColor textColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth target:(UIButton *)target;


/**
 将view设置成圆形

 @param view 目标view
 */
+ (void)viewHarfCornerRadiusByView:(UIView *)view;
@end
