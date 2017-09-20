//
//  SignViewController.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "SignViewController.h"

@implementation LoginModel


@end

@interface SignViewController ()<UITextFieldDelegate>
{
    
}
@property (nonatomic,strong) NSString *mobileNum;
@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UISetting];
}

- (void)UISetting{
    [self addGestureToAgreementLabel];
    
    _buttonSure.layer.masksToBounds = YES;
    _buttonSure.layer.cornerRadius = 4;
    
    [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_viewMobile borderWidth:1 cornerRadius:4];
    [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_viewCode borderWidth:1 cornerRadius:4];
    
    UIImage *image = [BGControlHelper gradientColorImageFromColors:@[kRedStartColor,kRedColor] gradientType:GradientTypeLeftToRight imgSize:_buttonSure.frame.size];
    _buttonSure.backgroundColor = [UIColor colorWithPatternImage:image];
//    [self setFontWithLabels];
}

- (void)setFontWithLabels{
    _label1.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeVeryLarge];
    _buttonSure.titleLabel.font = _buttonGetCode.titleLabel.font = _textFieldCode.font = _textFieldMobile.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeMiddle];
    _labelAtt.font = [UIFont fontWithName:kPingFangRegularName size:kfontSizeSmall];
}

- (void)addGestureToAgreementLabel{
    UITapGestureRecognizer *tapRecognizerChooseArea=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agreementLabelClick)];
    
    _labelAtt.userInteractionEnabled=YES;
    [_labelAtt addGestureRecognizer:tapRecognizerChooseArea];
}


#pragma mark - 网络请求

- (void)getVerifyFunc{
    

    
    [self showHudWithView:self.view title:@"请求中..."];
    [[AFClient shareInstance] getVerifyCodeByMobile:_mobileNum progressBlock:nil success:^(id responseBody) {
        if (responseBody) {
            if ([responseBody[@"status"] integerValue] == 0) {
                kAlert(responseBody[@"message"]);
                
                NSDictionary *dic = responseBody[@"data"];
                if ([dic[@"exists"] integerValue] == 1) {//已注册
                    
                }else{//未注册,弹出去微信关注公众号
                    
                }
                
            }else{
                [self alertVCByTitle:responseBody[@"message"] isBack:NO];
            }
        }else{
            [self alertVCByTitle:@"暂无数据" isBack:NO];
        }
        [self hiddenHud];
    } failure:^(NSError *error) {
        [self hiddenHud];
    }];
}


- (void)loginFunc{
    [self showHudWithView:self.view title:@"登录中..."];
    [[AFClient shareInstance] loginByMobile:_textFieldMobile.text code:_textFieldCode.text progressBlock:nil success:^(id responseBody) {
        if (responseBody) {
            if ([responseBody[@"status"] integerValue] == 0) {
                
                NSDictionary *dic = responseBody[@"data"];
                NSArray *tokenArray = [dic[@"token"] componentsSeparatedByString:@"."];
                NSString *token ;
                if (tokenArray.count > 1) {
                    token = tokenArray[1];
                    NSString *jsonString = [token base64DecodedString];
                    
                    NSDictionary *jsonDic = [jsonString dictionaryWithJsonString];
                    
                    LoginModel *model = [[LoginModel alloc] init];
                    [model setValuesForKeysWithDictionary:jsonDic];
                    
                    [[NSUserDefaults standardUserDefaults] setValue:model.sub forKey:@"mobile"];
                    [[NSUserDefaults standardUserDefaults] setValue:model.created forKey:@"creatDate"];
                    [[NSUserDefaults standardUserDefaults] setValue:model.id forKey:@"userId"];
                    [[NSUserDefaults standardUserDefaults] setValue:model.pwd forKey:@"password"];
                    [[NSUserDefaults standardUserDefaults] setValue:model.exp forKey:@"endDate"];

                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"main" object:nil];
                    
                }else{
                    kAlert(@"数据有误");
                }
                
            }else{
                [self alertVCByTitle:responseBody[@"message"] isBack:NO];
            }
        }else{
            [self alertVCByTitle:@"暂无数据" isBack:NO];
        }
        [self hiddenHud];
    } failure:^(NSError *error) {
        [self hiddenHud];
    }];
}

#pragma mark - 点击事件
//点击获取验证码
- (IBAction)getCodeButtonClick:(UIButton *)sender {
    [self.view endEditing:YES];
    if (![BGFunctionHelper checkTel:_textFieldMobile.text]) {
        kAlert(@"请输入正确的手机号");
        return;
    }else{
        _mobileNum = _textFieldMobile.text;
        [self getVerifyFunc];
    }
}

//点击确定
- (IBAction)sureButtonClick:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if (![BGFunctionHelper checkTel:_mobileNum]) {
        kAlert(@"手机号码有误");
        return;
    }
    
    [self loginFunc];
    
}

- (void)agreementLabelClick{
    kAlert(@"这里面是啥?");
}

#pragma textFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == _textFieldMobile) {
        [BorderHelper setLoginViewBorderColor:kGreenColor target:_viewMobile borderWidth:1 cornerRadius:4];
        [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_viewCode borderWidth:1 cornerRadius:4];
    }else{
        [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_viewMobile borderWidth:1 cornerRadius:4];
        [BorderHelper setLoginViewBorderColor:kGreenColor target:_viewCode borderWidth:1 cornerRadius:4];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _textFieldMobile) {
        [_textFieldCode becomeFirstResponder];
    }else{
        [self.view endEditing:YES];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_viewMobile borderWidth:1 cornerRadius:4];
    [BorderHelper setLoginViewBorderColor:ke6e6e6 target:_viewCode borderWidth:1 cornerRadius:4];
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
