//
//  GroupChatViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/31.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "GroupChatViewController.h"
#import "BGKeyboardView.h"

@interface GroupChatViewController ()
{
    
}
@property (nonatomic,strong) BGKeyboardView *bgKeyboard;
@end

@implementation GroupChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatBGKeyBoard];
}

- (void)creatBGKeyBoard{
    _bgKeyboard = [[BGKeyboardView alloc] initWithFrame:CGRectMake(0, kScreenSize.height - 64 - 49- 50, kScreenSize.width, 50)];
    [self.view addSubview:_bgKeyboard];
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
