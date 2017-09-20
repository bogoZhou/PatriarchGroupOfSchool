//
//  FindDetailNumbersView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FindDetailNumbersView.h"

@interface FindDetailNumbersView ()
{
    FindDetailModel *_detailModel;
}
@end

@implementation FindDetailNumbersView

- (instancetype)initWithFrame:(CGRect)frame model:(FindDetailModel *)model
{
    _detailModel = model;
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView{
    
    NSArray *array = @[@[@"收藏",_detailModel.collectionNumber]
                       ,@[@"家长点赞",_detailModel.likeNumber]
                       ,@[@"成员家长",_detailModel.memberNumber]];
    
    CGFloat width = self.sizeWidth/3;
    for (NSInteger i = 0; i < array.count; i ++) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(width * i, 0, width, self.sizeHeight)];
        
        UILabel *numberLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, backView.sizeWidth, 30)];
        numberLable.text = array[i][1];
        numberLable.textAlignment = NSTextAlignmentCenter;
        numberLable.font = [UIFont fontWithName:kPingFangMediumName size:21];
        [backView addSubview:numberLable];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, numberLable.allHeight, backView.sizeWidth, 25)];
        nameLabel.text = array[i][0];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
        [backView addSubview:nameLabel];
        
        [self addSubview:backView];
        
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
