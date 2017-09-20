//
//  FilesViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FilesViewController.h"
#import "FilePublicViewController.h"
#import "FilePrivatelyViewController.h"
#import "JXTHollowOutLabel.h"
@interface FilesViewController ()<UIScrollViewDelegate>
{
    
}
@property (nonatomic,strong) UIImageView *underLineImageView;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation FilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}

- (void)UISetting{
    [self creatTopView];
}

- (void)creatTopView{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 50)];
    topView.backgroundColor = kWhiteColor;
    [self.view addSubview:topView];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width/2, 48)];
    leftView.backgroundColor = kBlackColor;
    [topView addSubview:leftView];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(kScreenSize.width/2, 0, kScreenSize.width/2, 48)];
    rightView.backgroundColor = kBlackColor;
    [topView addSubview:rightView];
    
    _underLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width/2+1, 50)];
    _underLineImageView.backgroundColor = kGreenColor;
    [topView addSubview:_underLineImageView];
    
    UIView*centerView = [[UIView alloc] initWithFrame:CGRectMake(kScreenSize.width/2, 0, 1, 48)];
    centerView.backgroundColor = kWhiteColor;
    [topView addSubview:centerView];
    UIImageView *centerLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 16, 1, 18)];
    centerLineImageView.backgroundColor = ke6e6e6;
    [centerView addSubview:centerLineImageView];

    JXTHollowOutLabel *leftLabel = [[JXTHollowOutLabel alloc] initWithFrame:leftView.frame];
    leftLabel.backgroundColor = kWhiteColor;
    leftLabel.text = @"群私有区";
    leftLabel.font = [UIFont fontWithName:kPingFangRegularName size:16];
    leftLabel.textColor = kWhiteColor;
    leftLabel.textAlignment = NSTextAlignmentCenter;
    
    UITapGestureRecognizer *tapRecognizer1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftMove)];
    
    leftLabel.userInteractionEnabled=YES;
    [leftLabel addGestureRecognizer:tapRecognizer1];
    
    [topView addSubview:leftLabel];
    
    JXTHollowOutLabel *rightLabel = [[JXTHollowOutLabel alloc] initWithFrame:rightView.frame];
    rightLabel.backgroundColor = kWhiteColor;
    rightLabel.text = @"平台公共区";
    rightLabel.font = [UIFont fontWithName:kPingFangRegularName size:16];
    rightLabel.textColor = kWhiteColor;
    rightLabel.textAlignment = NSTextAlignmentCenter;
    
    UITapGestureRecognizer *tapRecognizer2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightMove)];
    
    rightLabel.userInteractionEnabled=YES;
    [rightLabel addGestureRecognizer:tapRecognizer2];
    
    [topView addSubview:rightLabel];
    
    
    
    [self creatScrollView];
}

- (void)creatScrollView{
    UIStoryboard *storyboard = kPublicStroyboard;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, kScreenSize.width, kScreenSize.height - 50)];
    _scrollView.contentSize = CGSizeMake(kScreenSize.width*2, kScreenSize.height - 50);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, _scrollView.sizeHeight - 100)];
    view1.backgroundColor = kRedColor;
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(kScreenSize.width, 0, kScreenSize.width, _scrollView.sizeHeight)];
    view2.backgroundColor = kBlueColor;
    [_scrollView addSubview:view1];
    [_scrollView addSubview:view2];
    
    
    FilePrivatelyViewController *privatelyVC = [storyboard instantiateViewControllerWithIdentifier:@"FilePrivatelyViewController"];
    privatelyVC.view.frame = CGRectMake(0, 0, kScreenSize.width, view1.sizeHeight);
    [self addChildViewController:privatelyVC];
    
    FilePublicViewController *publicVC = [storyboard instantiateViewControllerWithIdentifier:@"FilePublicViewController"];
    privatelyVC.view.frame = CGRectMake(0, 0, kScreenSize.width, view2.sizeHeight);
    [self addChildViewController:publicVC];
    
    [view1 addSubview:privatelyVC.view];
    [view2 addSubview:publicVC.view];
    
    [self.view addSubview:_scrollView];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _underLineImageView.frame = CGRectMake(scrollView.contentOffset.x/2, _underLineImageView.orginY, _underLineImageView.sizeWidth, _underLineImageView.sizeHeight);
}


#pragma mark - 点击事件

- (void)leftMove{
    [UIView animateWithDuration:0.2 animations:^{
        _scrollView.contentOffset = CGPointMake(0, _scrollView.contentOffset.y);
    }];
}

- (void)rightMove{
    [UIView animateWithDuration:0.2 animations:^{
        _scrollView.contentOffset = CGPointMake(kScreenSize.width, _scrollView.contentOffset.y);
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
