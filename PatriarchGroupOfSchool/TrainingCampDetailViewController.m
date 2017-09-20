//
//  TrainingCampDetailViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "TrainingCampDetailViewController.h"
#import "YJSliderView.h"

#import "CampDetailAboutPersonViewController.h"

#import "GroupChatViewController.h"
#import "TopicViewController.h"
#import "EliteViewController.h"
#import "FilesViewController.h"

@interface TrainingCampDetailViewController ()<YJSliderViewDelegate>

@property (strong, nonatomic) IBOutlet YJSliderView *sliderView;
@property (nonatomic, strong) NSArray *viewsArray;
@property (nonatomic,strong) NSArray *nameArray;

@end

@implementation TrainingCampDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:_titleString];
    [self navBarbackButton:nil];
    [self rightButtonImage:[UIImage imageNamed:@"more"]];
    [self UISetting];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)UISetting{
    [self setSubView];
}

#pragma mark - 创建子页面

- (void)setSubView{
    self.sliderView.delegate = self;
    self.sliderView.themeColor = kGreenColor;
    self.viewsArray = [NSArray new];
    self.nameArray = [NSArray new];
    
    UIStoryboard *storyboard = kPublicStroyboard;
    
    GroupChatViewController *groupVC = [storyboard instantiateViewControllerWithIdentifier:@"GroupChatViewController"];
    TopicViewController *topicVC = [storyboard instantiateViewControllerWithIdentifier:@"TopicViewController"];
    EliteViewController *eliteVC = [storyboard instantiateViewControllerWithIdentifier:@"EliteViewController"];
    FilesViewController *filesVC = [storyboard instantiateViewControllerWithIdentifier:@"FilesViewController"];
    
    
    [self addChildViewController:groupVC];
    [self addChildViewController:topicVC];
    [self addChildViewController:eliteVC];
    [self addChildViewController:filesVC];
    
    self.viewsArray = @[groupVC.view,topicVC.view,eliteVC.view,filesVC.view];
    self.nameArray = @[@"群聊",@"话题",@"精华区",@"文件"];
}


- (NSInteger)numberOfItemsInYJSliderView:(YJSliderView *)sliderView {
    return 4;
}

- (UIView *)yj_SliderView:(YJSliderView *)sliderView viewForItemAtIndex:(NSInteger)index {
    //因为没有写重用的逻辑，建议在控制器中定义view的数组，在此处取出展示(注意在此处定义控制器传入它的view，view中的子视图最好使用约束进行布局)
    return self.viewsArray[index];
}

- (NSString *)yj_SliderView:(YJSliderView *)sliderView titleForItemAtIndex:(NSInteger)index {
    
    return self.nameArray[index];
}

#pragma mark - 点击事件
//点击右边按钮
- (void)rightNavButtonClick{
    UIStoryboard *storyboard = kPublicStroyboard;
    CampDetailAboutPersonViewController *personDetail = [storyboard instantiateViewControllerWithIdentifier:@"CampDetailAboutPersonViewController"];
    [self.navigationController pushViewController:personDetail animated:YES];
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
