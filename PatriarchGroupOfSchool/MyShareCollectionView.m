//
//  MyShareCollectionView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "MyShareCollectionView.h"
#import "BGShareHelper.h"

@interface MyShareCollectionView ()
{
    FindDetailModel *_detailModel;

}
@property (nonatomic,strong) UILabel *labelCollection;
@property (nonatomic,strong) UIImageView *imageViewCollection;
@end

@implementation MyShareCollectionView


- (instancetype)initWithFrame:(CGRect)frame model:(FindDetailModel *)model
{
    _detailModel = model;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kWhiteColor;
        [self creatTopLine];
        [self creatShareView];
        [self creatCollectionView];
        [self creatJoinButton];
    }
    return self;
}

- (void)creatShareView{
    
    CGFloat allWidth = (self.sizeWidth - 25) * 9/20;
    
    UIView *shareView = [[UIView alloc] initWithFrame:CGRectMake(allWidth/5, 11, 30, 50)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.image = [UIImage imageNamed:@"share"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [shareView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 30, 20)];
    label.text = @"分享";
    label.textColor = kGreenColor;
    label.font = [UIFont fontWithName:kPingFangRegularName size:11];
    label.textAlignment = NSTextAlignmentCenter;
    [shareView addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [shareView addSubview:button];
    
    [self addSubview:shareView];
    
}

- (void)creatCollectionView{
    
    CGFloat allWidth = (self.sizeWidth - 25) * 9/20;
    
    UIView *collectionView = [[UIView alloc] initWithFrame:CGRectMake(allWidth/5*3, 11, 30, 50)];
    
    _imageViewCollection = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _imageViewCollection.image = [UIImage imageNamed:@"collection"];
    _imageViewCollection.contentMode = UIViewContentModeScaleAspectFit;
    [collectionView addSubview:_imageViewCollection];
    
    _labelCollection = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 30, 20)];
    _labelCollection.text = @"收藏";
    _labelCollection.textColor = kGreenColor;
    _labelCollection.font = [UIFont fontWithName:kPingFangRegularName size:11];
    _labelCollection.textAlignment = NSTextAlignmentCenter;
    [collectionView addSubview:_labelCollection];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(collectionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 21;
    [collectionView addSubview:button];
    
    [self addSubview:collectionView];
    
}

- (void)creatJoinButton{
    CGFloat allWidth = (self.sizeWidth - 25) * 9/20;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(allWidth, 11, (self.sizeWidth - 25) * 11/20, 50)];
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:button.frame.size];
    button.backgroundColor = [UIColor colorWithPatternImage:image];
    button.titleLabel.font = [UIFont fontWithName:kPingFangRegularName size:16];
    button.titleLabel.textColor = kWhiteColor;
    [button setTitle:@"立即加入" forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    [button addTarget:self action:@selector(joinButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)creatTopLine{
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.sizeWidth, 1)];
    lineImageView.backgroundColor = kf2f2f2;
    [self addSubview:lineImageView];
}


#pragma mark - 点击事件

- (void)shareButtonClick:(UIButton *)button{
//    kAlert(_detailModel.name);
    [BGShareHelper shareWeChatByController:self.viewController imageArray:nil];
}

- (void)collectionButtonClick:(UIButton *)button{
//    kAlert(_detailModel.collectionName);
    
    if (button.tag == 21) {//收藏
//        _labelCollection.text = @"取消";
        _imageViewCollection.image = [UIImage imageNamed:@"collectioned"];
        button.tag = 22;
        kAlert(@"收藏成功,您可在我的收藏中查看");
    }else{//取消收藏
//        _labelCollection.text = @"收藏";
        _imageViewCollection.image = [UIImage imageNamed:@"collection"];
        button.tag = 21;
        kAlert(@"已取消收藏");

    }
    
}

- (void)joinButtonClick:(UIButton *)button{
//    kAlert(@"点击加入");
    UIStoryboard *storyboard = kModalStroyboard;
    UINavigationController *nav = [storyboard instantiateViewControllerWithIdentifier:@"payNavVC"];
    nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.5;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = kCATransitionFade;
//    animation.subtype = kCATransitionFromLeft;
//    [self.viewController.view.window.layer addAnimation:animation forKey:nil];
    
    [self.viewController presentViewController:nav animated:YES completion:nil];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
