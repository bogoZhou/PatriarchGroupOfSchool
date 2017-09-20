//
//  FindDetailCommentView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FindDetailCommentView.h"

@interface FindDetailCommentView ()
{
    FindDetailModel *_detailModel;
}
@end

@implementation FindDetailCommentView

- (instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)showDataWithModel:(FindDetailModel *)model block:(FindDetailBlock)block{
    _detailBlock = block;
    _detailModel = model;
    
    if (_detailModel.showGroup.integerValue == 1) {
        [self showGroupView];

    }else{
        [self creatView];

    }
    
}

- (void)creatView{
    
    CGSize titleSize = [_detailModel.name boundingRectWithSize:CGSizeMake(kScreenSize.width - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangMediumName size:kfontSizeSmall]} context:nil].size;

    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 25, self.sizeWidth - 50, titleSize.height)];
    titleLabel.text = _detailModel.name;
    titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeSmall];
    [self addSubview:titleLabel];
    

    
    CGFloat sizeWith;
    if (_detailModel.showQuan.integerValue == 1) {
        sizeWith = kScreenSize.width - 50 - 64 - 10;
    }else{
        sizeWith = kScreenSize.width - 50;
    }
    
    titleSize = [_detailModel.collectionName boundingRectWithSize:CGSizeMake(sizeWith, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall]} context:nil].size;

    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, titleLabel.allHeight + 10, sizeWith, titleSize.height)];
    contentLabel.text = _detailModel.collectionName;
    contentLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    contentLabel.alpha = 0.5;
    contentLabel.numberOfLines = 0;
    [self addSubview:contentLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, contentLabel.allHeight + 25, self.sizeWidth - 50, 1)];
    imageView.backgroundColor = kf2f2f2;
    [self addSubview:imageView];
    
    if (_detailModel.showQuan.integerValue == 1) {
        UIImageView *quanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenSize.width - 25 - 64, imageView.allHeight/2 - 12, 64, 24)];
        quanImageView.image = [UIImage imageNamed:@"youhuiq"];
        [self addSubview:quanImageView];
    }
    
    _detailBlock(imageView.allHeight);
    
}

- (void)showGroupView{
    
    NSString *nameString = [NSString stringWithFormat:@"%@ (%ld成员)",_detailModel.name,_detailModel.groups.count];
    
    CGSize titleSize = [nameString boundingRectWithSize:CGSizeMake(kScreenSize.width - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangMediumName size:kfontSizeSmall]} context:nil].size;

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 25, self.sizeWidth - 50, titleSize.height)];
    titleLabel.text = nameString;
    titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeSmall];
    [self addSubview:titleLabel];
    
    CGFloat count = (kScreenSize.width - 50)/50;
    NSNumber *countString = [NSNumber numberWithFloat:count];
    for (NSInteger i = 0; i < (countString.integerValue > _detailModel.groups.count ? _detailModel.groups.count : countString.integerValue); i ++) {
        
        UIView *headersView = [[UIView alloc] initWithFrame:CGRectMake(25 + ((kScreenSize.width - 50)/50 + (kScreenSize.width - 50 - ((kScreenSize.width - 50)/50) * 50)/((kScreenSize.width - 50)/50 -1) + 50) * i, 30 + titleLabel.allHeight, 50, 50)];
        UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        headImageView.image = kBoy;
        [headersView addSubview:headImageView];
        
        [self addSubview:headersView];
    }
    
    
    _detailBlock(titleLabel.allHeight + 30 + 50 + 30);

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
