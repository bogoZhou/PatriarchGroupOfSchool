//
//  LabelsView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "LabelsView.h"

@implementation LabelsView

- (instancetype)initWithFrame:(CGRect)frame labelsArray:(NSArray *)labelsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubViewsWithLabelsArray:labelsArray];
    }
    return self;
}

- (void)creatSubViewsWithLabelsArray:(NSArray *)labelsArray{
    
    for (NSInteger i = 0; i < (labelsArray.count > 3 ?  3 : labelsArray.count); i ++) {
        NSString *contentString = labelsArray[i];
        
//        CGSize titleSize = [contentString boundingRectWithSize:CGSizeMake(kScreenSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangMediumName size:11]} context:nil].size;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake( (4 + 64) * i, 0, 64, self.sizeHeight)];
        label.text = contentString;
        label.textColor = kWhiteColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = kColorFrom0x(0xFABE02);
        label.font = [UIFont fontWithName:kPingFangMediumName size:11];
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 4;
        
        [self addSubview:label];
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
