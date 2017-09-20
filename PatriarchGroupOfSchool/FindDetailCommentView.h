//
//  FindDetailCommentView.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseView.h"
#import "FindDetailViewController.h"

typedef void(^FindDetailBlock)(CGFloat height);

@interface FindDetailCommentView : BaseView

@property (nonatomic,strong) FindDetailBlock detailBlock;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)showDataWithModel:(FindDetailModel *)model block:(FindDetailBlock)block;

@end
