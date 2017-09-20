//
//  FindDetailViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FindDetailViewController.h"
#import "FindDetailTitleWithImageView.h"
#import "FindDetailTitleWithStringView.h"
#import "FindDetailNumbersView.h"
#import "UserView.h"
#import "FindDetailCommentView.h"
#import "MyShareCollectionView.h"
#import "PaySuccessViewController.h"


@implementation FindDetailModel

@end

@interface FindDetailViewController ()

@end

@implementation FindDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navBarTitle:@"机构直通车"];
    [self navBarbackButton:nil];
    
    [self UISetting];
    
    if (_type .integerValue == 1) {
        [self creatheaderView];
    }else{
        [self creatHeaderViewString];
    }
    [self creatNumberView];
    [self creatUserView];
    [self creatCommentView];
    [self creatShareView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}

- (void)UISetting{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height - 72 - 64)];
    _scrollView.backgroundColor = kWhiteColor;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_scrollView];
    
    [self getNoti];
}

- (void)getNoti{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getSuccessNotiFuncByNoti:) name:@"paySuccess" object:nil];
}

#pragma mark - noti

- (void)getSuccessNotiFuncByNoti:(NSNotification *)noti{
    UIStoryboard *storyboard = kModalStroyboard;
    PaySuccessViewController *paySuccessVC = [storyboard instantiateViewControllerWithIdentifier:@"PaySuccessViewController"];
    paySuccessVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.5;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = kCATransitionFade;
//    animation.subtype = kCATransitionFromLeft;
//    [self.view.window.layer addAnimation:animation forKey:nil];
    
    
    [self presentViewController:paySuccessVC animated:YES completion:nil];
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"paySuccess" object:nil];
}

#pragma mark - 创建View

- (void)creatheaderView{
    FindDetailModel *model = [[FindDetailModel alloc] init];
    model.name = @"烧波教育";
    model.collectionName = @"洗脚 + 修脚 + 全身按摩 + 采耳 + 你懂得";
    FindDetailTitleWithImageView *headerView = [[FindDetailTitleWithImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 100) model:model];
    [_scrollView addSubview:headerView];
}

- (void)creatHeaderViewString{
    FindDetailModel *model = [[FindDetailModel alloc] init];
    model.name = @"烧波教育";
    model.collectionName = @"洗脚 + 修脚 + 全身按摩 + 采耳 + 你懂得";
    FindDetailTitleWithStringView *headerView = [[FindDetailTitleWithStringView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 100) model:model];
    [_scrollView addSubview:headerView];
}


- (void)creatNumberView{
    FindDetailModel *model = [[FindDetailModel alloc] init];
    model.collectionNumber = @"1234";
    model.likeNumber = @"998";
    model.memberNumber = @"1024";
    
    FindDetailNumbersView *numberView = [[FindDetailNumbersView alloc] initWithFrame:CGRectMake(0, 100, kScreenSize.width, 90) model:model];
    [_scrollView addSubview:numberView];
    
    UIImageView*lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, numberView.allHeight, kScreenSize.width - 50, 1)];
    lineImage.backgroundColor = kf2f2f2;
    [_scrollView addSubview:lineImage];
}

- (void)creatUserView{
    UserView *userView = [[UserView alloc] initWithFrame:CGRectMake(0, 190+10, kScreenSize.width, 110)];
    [_scrollView addSubview:userView];
    
    UIImageView*lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, userView.allHeight + 10, kScreenSize.width - 50, 1)];
    lineImage.backgroundColor = kf2f2f2;
    [_scrollView addSubview:lineImage];
    
    UserView *userView2 = [[UserView alloc] initWithFrame:CGRectMake(0, lineImage.allHeight + 10, kScreenSize.width, 110)];
    [_scrollView addSubview:userView2];
    
    UIImageView*lineImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(25, userView2.allHeight + 10, kScreenSize.width - 50, 1)];
    lineImage2.backgroundColor = kf2f2f2;
    lineImage2.tag = 1111;
    [_scrollView addSubview:lineImage2];
}

- (void)creatCommentView{
    UIImageView *imageView = [self.view viewWithTag:1111];
    
    FindDetailModel *model = [[FindDetailModel alloc] init];
    model.name = @"平台点评";
    model.collectionName = @"直接与四季教育的高层领导交流咨询。本训练营是司机教育唯一官方授权的第三方平台";
    
    FindDetailCommentView *commentView = [[FindDetailCommentView alloc] initWithFrame:CGRectMake(0, imageView.allHeight, kScreenSize.width, 150)];
    
    [commentView showDataWithModel:model block:^(CGFloat height) {
        commentView.frame = CGRectMake(commentView.orginX, commentView.orginY, commentView.sizeWidth, height);
    }];
    
    [_scrollView addSubview:commentView];
    
    FindDetailModel *model2 = [[FindDetailModel alloc] init];
    model2.name = @"导师说";
    model2.collectionName = @"大家知道四季的奥数很强，但我们的幼生小课程已重磅推出，逻辑思维、语言表达等课程非常有特色，欢迎了解。我家小孩目前就读于某顶尖初中，也欢迎交流育儿经验。";
    
    FindDetailCommentView *commentView2 = [[FindDetailCommentView alloc] initWithFrame:CGRectMake(0, commentView.allHeight, kScreenSize.width, 150)];
    
    [commentView2 showDataWithModel:model2 block:^(CGFloat height) {
        commentView2.frame = CGRectMake(commentView2.orginX, commentView2.orginY, commentView2.sizeWidth, height);
    }];
    
    
    [_scrollView addSubview:commentView2];

    
    FindDetailModel *model3 = [[FindDetailModel alloc] init];
    model3.name = @"本训练营实行打赏制度";
    model3.collectionName = @"季卡 ¥600  半年卡 ¥1000  年卡 ¥2000";
    model3.showQuan = @"1";
    
    FindDetailCommentView *commentView3 = [[FindDetailCommentView alloc] initWithFrame:CGRectMake(0, commentView2.allHeight, kScreenSize.width, 150)];
    
    [commentView3 showDataWithModel:model3 block:^(CGFloat height) {
        commentView3.frame = CGRectMake(commentView3.orginX, commentView3.orginY, commentView3.sizeWidth, height);
    }];
    
    [_scrollView addSubview:commentView3];
    
    FindDetailModel *model4 = [[FindDetailModel alloc] init];
    model4.name = @"已加入";
    model4.groups = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    model4.showGroup = @"1";
    
    FindDetailCommentView *commentView4 = [[FindDetailCommentView alloc] initWithFrame:CGRectMake(0, commentView3.allHeight, kScreenSize.width, 150)];
    
    [commentView4 showDataWithModel:model4 block:^(CGFloat height) {
        commentView4.frame = CGRectMake(commentView4.orginX, commentView4.orginY, commentView4.sizeWidth, height);
    }];
    
    [_scrollView addSubview:commentView4];
    
//    _layoutHeight.constant = commentView2.allHeight;
    _scrollView.contentSize = CGSizeMake(kScreenSize.width, commentView4.allHeight);
}

- (void)creatShareView{
    FindDetailModel *model = [[FindDetailModel alloc] init];
    model.name = @"我是谁";
    model.collectionName = @"大烧波";
    MyShareCollectionView *shareView = [[MyShareCollectionView alloc] initWithFrame:CGRectMake(0, kScreenSize.height - 72 - 64, kScreenSize.width, 72) model:model];
    [self.view addSubview:shareView];
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
