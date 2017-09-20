//
//  StarView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame Count:(NSInteger)count
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatImageView];
        [self hiddenStarByCount:count];
    }
    return self;
}

- (void)creatImageView{
    _imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.sizeWidth - 2 - 11, 1, 11, 11)];
    _imageView5.image = [UIImage imageNamed:@"x"];
    [self addSubview:_imageView5];
    
    _imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(_imageView5.orginX - 2 - 11, 1, 11, 11)];
    _imageView4.image = [UIImage imageNamed:@"x"];
    [self addSubview:_imageView4];
    
    _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(_imageView4.orginX - 2 - 11, 1, 11, 11)];
    _imageView3.image = [UIImage imageNamed:@"x"];
    [self addSubview:_imageView3];
    
    _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(_imageView3.orginX - 2 - 11, 1, 11, 11)];
    _imageView2.image = [UIImage imageNamed:@"x"];
    [self addSubview:_imageView2];
    
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(_imageView2.orginX - 2 - 11, 1, 11, 11)];
    _imageView1.image = [UIImage imageNamed:@"x"];
    [self addSubview:_imageView1];
}


- (void)hiddenStarByCount:(NSInteger)count{
    if (count == 1) {
        _imageView1.hidden = YES;
        _imageView2.hidden = YES;
        _imageView3.hidden = YES;
        _imageView4.hidden = YES;
        _imageView5.hidden = NO;
    }else if (count == 2){
        _imageView1.hidden = YES;
        _imageView2.hidden = YES;
        _imageView3.hidden = YES;
        _imageView4.hidden = NO;
        _imageView5.hidden = NO;
    }else if (count == 3){
        _imageView1.hidden = YES;
        _imageView2.hidden = YES;
        _imageView3.hidden = NO;
        _imageView4.hidden = NO;
        _imageView5.hidden = NO;
    }else if (count == 4){
        _imageView1.hidden = YES;
        _imageView2.hidden = NO;
        _imageView3.hidden = NO;
        _imageView4.hidden = NO;
        _imageView5.hidden = NO;
    }else{
        _imageView1.hidden = NO;
        _imageView2.hidden = NO;
        _imageView3.hidden = NO;
        _imageView4.hidden = NO;
        _imageView5.hidden = NO;
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
