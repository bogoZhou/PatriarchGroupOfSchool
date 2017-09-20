//
//  FileCell.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/12.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FileCell.h"


@implementation FileCell

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)showDataWithModel{
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView * headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 20, 50, 50)];
    headerImageView.image = [UIImage imageNamed:@"ptf"];
    [self addSubview:headerImageView];
    
    
    NSString *dateString = @"09-12";
    CGSize titleSize = [dateString boundingRectWithSize:CGSizeMake(kScreenSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:14]} context:nil].size;

    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenSize.width - 25 - titleSize.width, 22, titleSize.width, 20)];
    dateLabel.text = dateString;
    dateLabel.textColor = kBlackColor;
    dateLabel.alpha = 0.5;
    dateLabel.font = [UIFont fontWithName:kPingFangRegularName size:14];
    [self addSubview:dateLabel];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 22, kScreenSize.width - 90 - 25 - dateLabel.sizeWidth, 20)];
    nameLabel.text = @"关于专注力的培养.pdf";
    nameLabel.textColor = kBlackColor;
    nameLabel.alpha = 1;
    nameLabel.font = [UIFont fontWithName:kPingFangMediumName size:17];
    [self addSubview:nameLabel];
    
    
    NSString *sizeString = @"128kb 来自 ";
    titleSize = [sizeString boundingRectWithSize:CGSizeMake(kScreenSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:14]} context:nil].size;
    
    UILabel *sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, nameLabel.allHeight + 5, titleSize.width, 20)];
    sizeLabel.text = sizeString;
    sizeLabel.textColor = kBlackColor;
    sizeLabel.font = [UIFont fontWithName:kPingFangRegularName size:14];
    [self addSubview:sizeLabel];
    
    
    NSString *fromString = @"导师 大烧波";
    titleSize = [sizeString boundingRectWithSize:CGSizeMake(kScreenSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:14]} context:nil].size;
    
    UILabel *fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(sizeLabel.allWidth, sizeLabel.orginY, titleSize.width, 20)];
    fromLabel.text = fromString;
    fromLabel.textColor = kGreenColor;
    fromLabel.font = [UIFont fontWithName:kPingFangRegularName size:14];
    [self addSubview:fromLabel];
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(90, fromLabel.allHeight + 15, kScreenSize.width - 90, 1)];
    lineImageView.backgroundColor = ke6e6e6;
    [self addSubview:lineImageView];
    
}
//height -> 100


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
