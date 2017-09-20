//
//  BGTextView.m
//  BGTextViewDemo
//
//  Created by 周博 on 16/12/30.
//  Copyright © 2016年 BogoZhou. All rights reserved.
//

#import "BGTextView.h"

@interface BGTextView ()<UITextViewDelegate>
{
    
}
@property (nonatomic,strong) UILabel *placeholderLabel;

@property (nonatomic,strong) UILabel *writeNumLabel;

@end

@implementation BGTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _viewFrame = frame;
        [self setDefaultInfo];
        [self creatPlaceholderLabel];
    }
    return self;
}

- (void)setDefaultInfo{
    _placeholderStr = @"";
    
    _placeholderColor = [UIColor groupTableViewBackgroundColor];
    
    _textFontSize = 17;
    
    _textFont = [UIFont fontWithName:@"PingFangTC-Light" size:_textFontSize];
    
    _textViewTextColor = [UIColor blackColor];
}


- (void)creatPlaceholderLabel{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        [self addSubview:_placeholderLabel];
    }
    
    if (!_writeNumLabel) {
        _writeNumLabel = [[UILabel alloc] init];
        [self addSubview:_writeNumLabel];
    }
    
    _placeholderLabel.frame = CGRectMake(7, 7, self.frame.size.width - 10, 20);
    
    _placeholderLabel.text = _placeholderStr;
    
    _placeholderLabel.textColor = _placeholderColor;
    
    _placeholderLabel.font = _textFont;
    
    _placeholderLabel.alpha = 0.3;
    
    _writeNumLabel.frame = CGRectMake(10, _viewFrame.size.height - 20, _viewFrame.size.width - 20, 20);
    
//    _writeNumLabel.text = @"0/100";
    
    _writeNumLabel.textColor = _placeholderColor;
    
    _writeNumLabel.textAlignment = NSTextAlignmentRight;
    
    _writeNumLabel.font = _textFont;
    
    
    self.textColor = _textViewTextColor;
    
    self.font = _textFont;
    
    self.tintColor = _textViewTextColor;
    
    self.frame = _viewFrame;
    
    self.delegate = self;
}

- (void)updateInfo{
    [self creatPlaceholderLabel];
    self.keyboardType = UIKeyboardTypeDefault;
    self.spellCheckingType = UITextSpellCheckingTypeNo;
}

-(void)textViewDidChange:(UITextView *)textView{
    if (textView == nil || textView.text.length == 0 || [textView.text isEqualToString:@""]) {
        _placeholderLabel.hidden = NO;
    }else{
        _placeholderLabel.hidden = YES;
    }
    
    if (textView.text.length <= 100) {
        _writeNumLabel.text = [NSString stringWithFormat:@"%ld/100",textView.text.length];
    }else{
        textView.text = [textView.text substringToIndex:100];
    }
    
}


@end
