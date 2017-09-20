//
//  MyCollectionCampCell.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "MyCollectionCampCell.h"
#import "UserView.h"

@interface MyCollectionCampCell ()
{
    
}
@property (nonatomic,strong) UIImageView *lineImageView;
@end

@implementation MyCollectionCampCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
}


- (void)showDataWithModel{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    UserView *userView = [[UserView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 110)];
    [self addSubview:userView];
    
    NSString *contentString = @"平台点评：倡导高效快乐的学习方法，注重自主学习习惯的培养，侠客岛成员";
    
    CGSize titleSize = [contentString boundingRectWithSize:CGSizeMake(kScreenSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall]} context:nil].size;
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, userView.sizeHeight, kScreenSize.width - 90 - 25, titleSize.height)];
    contentLabel.text = contentString;
    contentLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    contentLabel.alpha = 0.5;
    contentLabel.numberOfLines = 2;
    [self addSubview:contentLabel];
    
   _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, userView.sizeHeight + titleSize.height + 15, kScreenSize.width - 50, 1)];
    _lineImageView.backgroundColor = kf2f2f2;
    [self addSubview:_lineImageView];
    
}

- (CGFloat)height{
    return _lineImageView.allHeight+0.5;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
