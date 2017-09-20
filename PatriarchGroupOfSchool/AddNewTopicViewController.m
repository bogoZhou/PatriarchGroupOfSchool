//
//  AddNewTopicViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/1.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "AddNewTopicViewController.h"
#import "TopicPutSuccessViewController.h"
#import "BGTextView.h"

@interface AddNewTopicViewController ()<UITextViewDelegate>
{
    
}
@property (nonatomic,strong) BGTextView *textView;
@end

@implementation AddNewTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarTitle:@"发起一个新的话题"];
    [self navBarbackButton:nil];
    [self UISetting];
}

- (void)UISetting{
    [self creatGestureOnScrollView:_scrollView];
    
    [BorderHelper setLoginViewBorderColor:kf2f2f2 target:_viewText borderWidth:1 cornerRadius:4];
    
    _buttonSure.layer.masksToBounds = YES;
    _buttonSure.layer.cornerRadius = 4;
    
    [self creatTextView];
    
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_buttonSure.frame.size];
    _buttonSure.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _layoutWidth.constant = kScreenSize.width;
    _layoutHeight.constant = 400;
    
    _label1.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
    _buttonSure.titleLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeLarge];
    
}

- (void)creatTextView{
    
    _textView = [[BGTextView alloc] initWithFrame:CGRectMake(15, 15, kScreenSize.width - 30 - 50, _viewText.sizeHeight - 30)];
    _textView.textFont = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _textView.placeholderStr = @"请输入话题的内容";
    _textView.placeholderColor = kBlackColor;
    _textView.textViewTextColor = [UIColor blackColor];
    _textView.backgroundColor = kClearColor;
    _textView.tintColor = [UIColor blackColor];
    [_textView updateInfo];
    _textView.delegate = self;
    [_viewText addSubview:_textView];

}


- (void)textViewDidChange:(UITextView *)textView{
    [_textView textViewDidChange:textView];
}
#pragma mark - 点击事件
//选择
- (IBAction)segmentClick:(UISegmentedControl *)sender {
}

//点击发表
- (IBAction)sureButtonClick:(UIButton *)sender {

    UIStoryboard *storyboard = kPublicStroyboard;
    
    TopicPutSuccessViewController *topicSuccessVC = [storyboard instantiateViewControllerWithIdentifier:@"TopicPutSuccessViewController"];
    [self.navigationController pushViewController:topicSuccessVC animated:YES];
    
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
