//
//  FindView.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseView.h"
#import "FindItemsView.h"

typedef void (^FindViewBlock)(CGRect findViewFrame);


@interface FindView : BaseView

@property (nonatomic,strong) FindItemsClickBlock findItemClickBlock;

@property (nonatomic,strong) FindViewBlock findViewBlock;

- (instancetype)initWithFrame:(CGRect)frame viewName:(NSString *)viewName array:(NSMutableArray *)array block:(FindViewBlock)block clickBlock:(FindItemsClickBlock)clickBlock;

@end
