//
//  FindDetailTitleWithStringView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FindDetailTitleWithStringView.h"

@interface FindDetailTitleWithStringView ()
{
    FindDetailModel *_detailModel;
}
@end

@implementation FindDetailTitleWithStringView

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

    CGSize titleSize = [_detailModel.name boundingRectWithSize:CGSizeMake(kScreenSize.width - 50 - 70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangMediumName size:18]} context:nil].size;
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 25, titleSize.width, 25)];
    nameLabel.text = _detailModel.name;
    nameLabel.font = [UIFont fontWithName:kPingFangMediumName size:18];
    [self addSubview:nameLabel];
    
    
    titleSize = [@"热门" boundingRectWithSize:CGSizeMake(kScreenSize.width - 50 - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangMediumName size:11]} context:nil].size;
    UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabel.allWidth +15, 25, titleSize.width + 30, 25)];
    typeLabel.text = @"热门";
    typeLabel.font = [UIFont fontWithName:kPingFangMediumName size:11];
    typeLabel.textAlignment = NSTextAlignmentCenter;
    typeLabel.layer.masksToBounds = YES;
    typeLabel.layer.cornerRadius = 4;
    typeLabel.backgroundColor = kRedColor;
    typeLabel.textColor = kWhiteColor;
    [self addSubview:typeLabel];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, typeLabel.allHeight + 5, self.sizeWidth - 25 - 15 - 25, 20)];
    contentLabel.text = _detailModel.collectionName;
    contentLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    contentLabel.alpha = 0.5;
    [self addSubview:contentLabel];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
