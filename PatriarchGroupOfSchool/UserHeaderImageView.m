//
//  UserHeaderImageView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/1.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "UserHeaderImageView.h"
#import "LookUserDetailViewController.h"

@interface UserHeaderImageView ()
{
    NSArray *_dataArray;
    NSString *_name;
    CGFloat _viewHeight;
    BOOL _isShowAllUser;
}

@end

@implementation UserHeaderImageView

- (instancetype)initWithFrame:(CGRect)frame viewName:(NSString *)viewName array:(NSArray *)array isShowAll:(BOOL)isShowAll block:(UserHeaderImageViewBlock)block
{
    _isShowAllUser = isShowAll;
    _myBlock = block;
    _name = viewName;
    _dataArray = array;
    self = [super initWithFrame:frame];
    if (self) {
        [self creatTitleLabel];
        [self creatContentView];
    }
    return self;
}

- (void)creatTitleLabel{
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 25, self.sizeWidth - 50, 20)];
    nameLabel.text = [NSString stringWithFormat:@"%@(%ld)",_name,_dataArray.count];
    nameLabel.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    nameLabel.alpha = 1;
    [self addSubview:nameLabel];
}

- (void)creatContentView{
    CGFloat width = 40;
    CGFloat space = ((self.sizeWidth - 50) - width*5)/4;
    
    for (NSInteger i = 0 ; i < (_isShowAllUser == YES ? _dataArray.count : (_dataArray.count > 15 ? 15 : _dataArray.count)); i ++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(25 + (width + space) * (i%5),25+ 20 +15 + (15 + 60) *(i/5), width, 60)];
        view.backgroundColor = kWhiteColor;
        [self addSubview:view];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
        imageView.image = kBoy;
        [view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.sizeHeight, width, 20)];
        label.text = @"bogo";
        label.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
        label.textAlignment = NSTextAlignmentCenter;
        label.alpha = 0.54;
        [view addSubview:label];
        _viewHeight = view.allHeight;
    }
    
    if (_isShowAllUser) {
        self.frame = CGRectMake(self.orginX, self.orginY, self.sizeWidth, _viewHeight);
        _myBlock(_viewHeight);
    }else{
        if (_dataArray.count > 15) {
            [self creatLookAllView];
        }else{
            self.frame = CGRectMake(self.orginX, self.orginY, self.sizeWidth, _viewHeight);
            _myBlock(_viewHeight);
        }
    }
    
}

- (void)creatLookAllView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _viewHeight, self.sizeWidth, 70)];
    [self addSubview:view];
    
    UIView *centerView = [[UIView alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"查看全部%@",_name];
    CGSize titleSize = [string boundingRectWithSize:CGSizeMake(kScreenSize.width - 50 - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall]} context:nil].size;

    UILabel *labelLook = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleSize.width, 20)];
    labelLook.text = string;
    labelLook.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    labelLook.alpha = 0.54;
    [centerView addSubview:labelLook];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(labelLook.sizeWidth+3, 3, 14, 14)];
    imageView.image = [UIImage imageNamed:@"next"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [centerView addSubview:imageView];
    
    
    centerView.frame = CGRectMake((self.sizeWidth - imageView.allWidth)/2, 25, imageView.allWidth, 20);
    [view addSubview:centerView];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, centerView.sizeWidth, centerView.sizeHeight)];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(lookUserButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerView addSubview:button];

    
    _viewHeight = view.allHeight ;
    
    self.frame = CGRectMake(self.orginX, self.orginY, self.sizeWidth, _viewHeight);

    _myBlock(_viewHeight);
}

- (void)lookUserButtonClick:(UIButton *)button{
    UIStoryboard *storyboard = kPublicStroyboard;
    
    LookUserDetailViewController *lookUserDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"LookUserDetailViewController"];
    lookUserDetailVC.dataArray = _dataArray;
    lookUserDetailVC.name = _name;
    [self.viewController.navigationController pushViewController:lookUserDetailVC animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
