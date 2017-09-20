//
//  SignViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/29.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginModel : BaseModel

@property (nonatomic,strong) NSString *sub;
@property (nonatomic,strong) NSString *created;
@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *pwd;
@property (nonatomic,strong) NSString *exp;


@end

@interface SignViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UIView *viewMobile;
@property (strong, nonatomic) IBOutlet UITextField *textFieldMobile;

@property (strong, nonatomic) IBOutlet UIView *viewCode;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCode;

@property (strong, nonatomic) IBOutlet UIButton *buttonGetCode;

@property (strong, nonatomic) IBOutlet UIButton *buttonSure;

@property (strong, nonatomic) IBOutlet UILabel *labelAtt;

@property (strong, nonatomic) IBOutlet UILabel *label1;

@end
