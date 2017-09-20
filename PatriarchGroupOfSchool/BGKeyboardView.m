//
//  BGKeyboardView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/12.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BGKeyboardView.h"
#import "AddNewTopicViewController.h"

@interface BGKeyboardView ()<UITextViewDelegate>
{
    
}
@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) UIView *inputView;

@property (nonatomic,strong) UIView *contentView;

@end

@implementation BGKeyboardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatKeyboardView];
    }
    return self;
}

- (void)creatKeyboardView{
    
    _inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 50)];
    _inputView.backgroundColor = kWhiteColor;
    [self addSubview:_inputView];
    
    UIImageView *topLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 0.5)];
    topLineImageView.backgroundColor = kf2f2f2;
    [_inputView addSubview:topLineImageView];
    
    UIButton *soundsButton = [[UIButton alloc] initWithFrame:CGRectMake(5, _inputView.sizeHeight - 40, 30, 30)];
    [soundsButton setBackgroundImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
    soundsButton.tag = 11;
    [soundsButton addTarget:self action:@selector(soundsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:soundsButton];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenSize.width - 30 - 5, _inputView.sizeHeight - 40, 30, 30)];
    [addButton setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    addButton.tag = 21;
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:addButton];
    
    UIButton *emojiButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenSize.width - addButton.sizeWidth - 5 - 10 - 30, _inputView.sizeHeight -40 , 30, 30)];
    [emojiButton setBackgroundImage:[UIImage imageNamed:@"expression"] forState:UIControlStateNormal];
    emojiButton.tag = 31;
    [emojiButton addTarget:self action:@selector(emojiButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:emojiButton];
    
    _textView = [[UITextView  alloc] initWithFrame:CGRectMake(soundsButton.allWidth + 10, 10, kScreenSize.width - soundsButton.allWidth - 10 - emojiButton.sizeWidth*2 - 10 -10 -5, 30)];
    _textView.font = [UIFont fontWithName:kPingFangRegularName size:15];
    _textView.contentInset = UIEdgeInsetsMake(0.f, 5.f, 5.f, 5.f);
    _textView.layer.masksToBounds = YES;
    _textView.layer.cornerRadius = 4;
    _textView.layer.borderColor = [kd6d6d6 CGColor];
    _textView.layer.borderWidth = 1.f;
    [_inputView addSubview:_textView];
    
}

#pragma mark - 点击事件
//点击语音
- (void)soundsButtonClick:(UIButton *)button{
    if (button.tag == 11) {
        [button setBackgroundImage:[UIImage imageNamed:@"voiceMessageKeyboard"] forState:UIControlStateNormal];
        [_textView resignFirstResponder];
        button.tag = 12;
    }else{
        [button setBackgroundImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
        button.tag = 11;
    }
    
}

//点击加号
- (void)addButtonClick:(UIButton *)button{
    
    UIStoryboard *storyboard = kPublicStroyboard;
    AddNewTopicViewController *addNewTopic = [storyboard instantiateViewControllerWithIdentifier:@"AddNewTopicViewController"];
    [[self viewController].navigationController pushViewController:addNewTopic animated:YES];
    
    if (button.tag == 21) {

        
        [_textView resignFirstResponder];
        button.tag = 22;
    }else{
    
        button.tag = 21;
    }
}

//点击表情
- (void)emojiButtonClick:(UIButton *)button{
    if (button.tag == 31) {
        
        [_textView resignFirstResponder];
        button.tag = 32;
    }else{
        button.tag = 31;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
