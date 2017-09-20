//
//  StarView.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseView.h"

@interface StarView : BaseView

@property (strong, nonatomic)  UIImageView *imageView1;

@property (strong, nonatomic)  UIImageView *imageView2;

@property (strong, nonatomic)  UIImageView *imageView3;

@property (strong, nonatomic)  UIImageView *imageView4;

@property (strong, nonatomic)  UIImageView *imageView5;

@property (nonatomic,assign) NSInteger count;

- (instancetype)initWithFrame:(CGRect)frame Count:(NSInteger)count;

@end
