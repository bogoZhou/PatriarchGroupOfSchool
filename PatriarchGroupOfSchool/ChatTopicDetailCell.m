//
//  ChatTopicDetailCell.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "ChatTopicDetailCell.h"

@interface ChatTopicDetailCell ()
{
    CGFloat _cellHeight;
}
@end

@implementation ChatTopicDetailCell

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)showDataWithModel{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 40, 40)];
    imageView.image = kBoy;
    [self addSubview:imageView];
    
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(imageView.allWidth + 15, 25, kScreenSize.width - imageView.allWidth - 15 - 25, 20)];
    labelName.text = @"导师 烧波";
    labelName.textColor = [kBlackColor colorWithAlphaComponent:0.8];
    labelName.font = [UIFont fontWithName:kPingFangMediumName size:16];
    [self addSubview:labelName];
    
    UIView *topicView = [[UIView alloc] initWithFrame:CGRectMake(labelName.orginX, labelName.allHeight + 15, kScreenSize.width - imageView.allWidth - 15 - 25 , 50)];
    topicView.backgroundColor = kWhiteColor;
    [BorderHelper setLoginViewBorderColor:kf2f2f2 target:topicView borderWidth:1 cornerRadius:4];
    [self addSubview:topicView];
    
    UILabel *labelTopic = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, topicView.sizeWidth - 15, 20)];
    labelTopic.text = @"发起了一个新话题";
    labelTopic.textColor = [kBlackColor colorWithAlphaComponent:0.8];
    labelTopic.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    [topicView addSubview:labelTopic];
    
    
    NSString *string = @"专注浦东的洗脚房";
    CGSize titleSize = [string boundingRectWithSize:CGSizeMake(topicView.sizeWidth - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangMediumName size:16]} context:nil].size;
    UILabel *labelTopicContent = [[UILabel alloc] initWithFrame:CGRectMake(15, labelTopic.allHeight + 15, topicView.sizeWidth - 50, titleSize.height)];
    labelTopicContent.text = string;
    labelTopicContent.textColor = [kBlackColor colorWithAlphaComponent:1];
    labelTopicContent.font = [UIFont fontWithName:kPingFangMediumName size:16];
    [topicView addSubview:labelTopicContent];
    
    UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(topicView.sizeWidth - 30, labelTopicContent.allHeight - (labelTopicContent.sizeHeight - 15)/2 - 15, 15, 15)];
    rightImageView.image = [UIImage imageNamed:@"next"];
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    [topicView addSubview:rightImageView];
    
    UILabel *labelComment = [[UILabel alloc] initWithFrame:CGRectMake(15, labelTopicContent.allHeight + 15, topicView.sizeWidth - 30, 20)];
    labelComment.text = [NSString stringWithFormat:@"浏览 %@  回复 %@",@"666",@"76"];
    labelComment.font = [UIFont fontWithName:kPingFangRegularName size:12];
    labelComment.textColor = [kBlackColor colorWithAlphaComponent:0.5];
    [topicView addSubview:labelComment];
    
    topicView.frame = CGRectMake(topicView.orginX, topicView.orginY, topicView.sizeWidth, labelComment.allHeight + 20);
    
    _cellHeight = topicView.allHeight;
    
}

- (CGFloat)heigth{
    return  _cellHeight + 10;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
