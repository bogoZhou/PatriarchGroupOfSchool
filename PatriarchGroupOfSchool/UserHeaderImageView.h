//
//  UserHeaderImageView.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/1.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseView.h"

typedef void(^UserHeaderImageViewBlock)(CGFloat height);

@interface UserHeaderImageView : BaseView

@property (nonatomic,strong) UserHeaderImageViewBlock myBlock;

- (instancetype)initWithFrame:(CGRect)frame viewName:(NSString *)viewName array:(NSArray *)array isShowAll:(BOOL)isShowAll block:(UserHeaderImageViewBlock)block;

@end
