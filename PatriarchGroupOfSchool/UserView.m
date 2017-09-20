//
//  UserView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "UserView.h"
#import "StarView.h"
#import "LabelsView.h"

@implementation UserView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self creatView];
        [self creatMainView];
    }
    return self;
}

- (void)creatMainView{
    _imageViewHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 50, 50)];
    _imageViewHeader.image = kBoy;
    [self addSubview:_imageViewHeader];
    
    CGSize titleSize = [@"导师 大烧波" boundingRectWithSize:CGSizeMake(kScreenSize.width - 90 - 25-67 - 5, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangMediumName size:18]} context:nil].size;
    
    _labelName = [[UILabel alloc] initWithFrame:CGRectMake(90, 15, titleSize.width, titleSize.height)];
    _labelName.text = @"导师 大烧波";
    _labelName.font = [UIFont fontWithName:kPingFangMediumName size:18];
    [self addSubview:_labelName];
    
    _imageViewVIP = [[UIImageView alloc] initWithFrame:CGRectMake(_labelName.allWidth + 10, 15+5, 17, 17)];
    _imageViewVIP.image = [UIImage imageNamed:@"v"];
    [self addSubview:_imageViewVIP];
    
    StarView *starView = [[StarView alloc] initWithFrame:CGRectMake(self.sizeWidth - 25 - 67, 15+7 , 67, 13) Count:5];
    [self addSubview:starView];
    
    titleSize = [@"上外附小三年级家长" boundingRectWithSize:CGSizeMake(kScreenSize.width - 90 - 25 - 100 - 5, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall]} context:nil].size;
    _labelContent = [[UILabel alloc] initWithFrame:CGRectMake(90, _labelName.allHeight + 2, titleSize.width, titleSize.height)];
    _labelContent.text = @"上外附小三年级家长";
    _labelContent.alpha = 0.5;
    _labelContent.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    [self addSubview:_labelContent];
    
    titleSize = [@"¥200/月" boundingRectWithSize:CGSizeMake(kScreenSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:16]} context:nil].size;
    _labelMoneyOrStarLevel = [[UILabel alloc] initWithFrame:CGRectMake(self.sizeWidth - 25 - titleSize.width, starView.allHeight + 7, titleSize.width, titleSize.height)];
    _labelMoneyOrStarLevel.text = @"¥200/月";
    _labelMoneyOrStarLevel.font = [UIFont fontWithName:kPingFangRegularName size:16];
    [self addSubview:_labelMoneyOrStarLevel];

    LabelsView *labelsView = [[LabelsView alloc] initWithFrame:CGRectMake(90, _imageViewHeader.allHeight + 10, self.allWidth - 90 - 25, 25) labelsArray:@[@"学霸家长",@"奥术法师",@"大德鲁伊"]];
    [self addSubview:labelsView];
    
}


//
//- (void)creatView{
////    StarView *starView = [[StarView alloc] initWithFrame:CGRectMake(0, 0, 60, 13) Count:3];
//    StarView *starView = [[[NSBundle mainBundle] loadNibNamed:@"StarView" owner:self options:nil] lastObject];
//    starView.count = 3;
//    starView.backgroundColor = kRedColor;
//    [_viewStar addSubview:starView];
//    _viewStar.backgroundColor = kGreenColor;
//    
//    LabelsView *labelsView = [[LabelsView alloc] initWithFrame:CGRectMake(0, 0, _viewLabels.sizeWidth, 25) labelsArray:@[@"学霸家长",@"奥术法师",@"大德鲁伊"]];
//    [_viewLabels addSubview:labelsView];
//}
//

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
