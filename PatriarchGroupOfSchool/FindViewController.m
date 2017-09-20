//
//  FindViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FindViewController.h"
#import "SearchViewController.h"
#import "FindView.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
    
//    self.navigationController.fd_prefersNavigationBarHidden = YES;

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)UISetting{
    [self creatContentView];
    
//    _labelTitle.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeVeryLarge];
//    _labelCity.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
//    _labelContent.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    
}

- (void)creatContentView{
    NSMutableArray *array = [NSMutableArray array];
    FindItemsModel *model = [[FindItemsModel alloc] init];
    model.titleString = @"上大附小";
    model.contentString = @"";
    model.type = @"1";
    
    FindItemsModel *model2 = [[FindItemsModel alloc] init];
    model2.titleString = @"上外双语";
    model2.contentString = @"";
    model.type = @"2";

    FindItemsModel *model3 = [[FindItemsModel alloc] init];
    model3.titleString = @"盛大小学";
    model3.contentString = @"";
    model.type = @"1";

    FindItemsModel *model4 = [[FindItemsModel alloc] init];
    model4.titleString = @"明珠小学";
    model4.contentString = @"";
    model.type = @"1";

    for (NSInteger i = 0 ; i < 2; i ++) {
        [array addObject:model];
        [array addObject:model2];
        [array addObject:model3];
        [array addObject:model4];
    }
    
    NSMutableArray *array2 = [NSMutableArray array];
    FindItemsModel *mmodel = [[FindItemsModel alloc] init];
    mmodel.titleString = @"上大附小";
    mmodel.contentString = @"这里是描述";
    mmodel.type = @"1";
    
    FindItemsModel *mmodel2 = [[FindItemsModel alloc] init];
    mmodel2.titleString = @"上外双语";
    mmodel2.contentString = @"这里也是";
    mmodel2.type = @"2";
    
    FindItemsModel *mmodel3 = [[FindItemsModel alloc] init];
    mmodel3.titleString = @"盛大小学";
    mmodel3.contentString = @"还有这里";
    mmodel3.type = @"1";
    
    FindItemsModel *mmodel4 = [[FindItemsModel alloc] init];
    mmodel4.titleString = @"明珠小学";
    mmodel4.contentString = @"我也是";
    mmodel4.type = @"1";
    
    for (NSInteger i = 0 ; i < 2; i ++) {
        [array2 addObject:mmodel];
        [array2 addObject:mmodel2];
        [array2 addObject:mmodel3];
        [array2 addObject:mmodel4];
    }

    
    FindView *view = [[FindView alloc] initWithFrame:CGRectMake(0, 25, kScreenSize.width, 100) viewName:@"屌屌哒" array:array block:^(CGRect findViewFrame) {
        NSLog(@"frame.height -> %lf",findViewFrame.size.height);
        view.frame = findViewFrame;
    } clickBlock:^(FindItemsModel *model) {
        kAlert(model.titleString);
    }];
    
    [_viewScrollView addSubview:view];
    
    FindView *view2 = [[FindView alloc] initWithFrame:CGRectMake(0, view.allHeight, kScreenSize.width, 100) viewName:@"一点都不掉" array:array2 block:^(CGRect findViewFrame) {
        NSLog(@"frame.height -> %lf",findViewFrame.size.height);
        view2.frame = findViewFrame;
    } clickBlock:^(FindItemsModel *model) {
        kAlert(model.titleString);
    }];
    
    [_viewScrollView addSubview:view2];
    
    FindView *view3 = [[FindView alloc] initWithFrame:CGRectMake(0, view2.allHeight, kScreenSize.width, 100) viewName:@"我是一个大逗逼" array:array block:^(CGRect findViewFrame) {
        NSLog(@"frame.height -> %lf",findViewFrame.size.height);
        view3.frame = findViewFrame;
    } clickBlock:^(FindItemsModel *model) {
        kAlert(model.titleString);
    }];
    
    [_viewScrollView addSubview:view3];
    
    _layoutWidth.constant = kScreenSize.width;
    _layoutHeight.constant = view3.allHeight;
}


#pragma mark - 点击事件
//选择城市
- (IBAction)chooseCityButtonClick:(UIButton *)sender {
    kAlert(@"选择城市");
}

//点击查找
- (IBAction)findButtonClick:(UIButton *)sender {
//    kAlert(@"点击查找");
    UIStoryboard *storyboard = kPublicStroyboard;
    SearchViewController *searchVC = [storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
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
