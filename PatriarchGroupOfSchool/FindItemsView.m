//
//  FindItemsView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FindItemsView.h"
#import "FindDetailViewController.h"

@implementation FindItemsModel

@end

@interface FindItemsView ()
{
    
}
@property (nonatomic,strong) FindItemsModel *model;
@end

@implementation FindItemsView

- (instancetype)initWithFrame:(CGRect)frame findModel:(FindItemsModel *)findModel block:(FindItemsViewBlock)block clickBlock:(FindItemsClickBlock)clickBlock
{
    _findItemClickBlock = clickBlock;
    _model = findModel;
    _findItemsBlock = block;
    self = [super initWithFrame:frame];
    if (self) {
//        [self creatView];
        [self creatEqualView];
    }
    return self;
}

- (void)creatView{
    UILabel *labelTitle;
    UILabel *labelContent;
    CGFloat width;
    
    CGSize titleSize = [_model.titleString boundingRectWithSize:CGSizeMake(kScreenSize.width - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:16]} context:nil].size;

    width = titleSize.width;
    labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 11.5, titleSize.width, titleSize.height)];
    labelTitle.text = _model.titleString;
    labelTitle.font = [UIFont fontWithName:kPingFangRegularName size:16];
    labelTitle.alpha= 1;
    [self addSubview:labelTitle];
    
    if (![BGFunctionHelper isNULLOfString:_model.contentString]) {
        CGSize titleSize = [_model.contentString boundingRectWithSize:CGSizeMake(kScreenSize.width - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:12]} context:nil].size;
        
        if (width < titleSize.width) {
            width = titleSize.width;
        }
        
        labelContent = [[UILabel alloc] initWithFrame:CGRectMake(15, labelTitle.allHeight + 5, titleSize.width, titleSize.height)];
        labelContent.text = _model.contentString;
        labelContent.font = [UIFont fontWithName:kPingFangRegularName size:12];
        labelContent.alpha= 0.5;
        [self addSubview:labelContent];
        
    }else{
        labelContent = [[UILabel alloc] initWithFrame:CGRectMake(15, labelTitle.allHeight, 0, 0)];
    }
    
    self.frame = CGRectMake(self.orginX, self.orginY, width + 30, labelContent.allHeight + 11.5);
    
    [BorderHelper setLoginViewBorderColor:kColorFrom0x(0xf1f1f1) target:self borderWidth:1 cornerRadius:2];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.sizeWidth, self.sizeHeight)];
    [button setTitle:@"" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(chooseItemsButtonClick2:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(chooseItemsButtonClick3:) forControlEvents:UIControlEventTouchUpOutside];

    
    [button addTarget:self action:@selector(chooseItemsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    _findItemsBlock(self.frame);
    
    
}


- (void)creatEqualView{
    UILabel *labelTitle;
    UILabel *labelContent;
    CGFloat width;
    
//    CGSize titleSize = [_model.titleString boundingRectWithSize:CGSizeMake(kScreenSize.width - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:16]} context:nil].size;
    
    width = (kScreenSize.width - 50 - 20)/3;
    labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 11.5, width - 30, 20)];
    labelTitle.text = _model.titleString;
    labelTitle.font = [UIFont fontWithName:kPingFangRegularName size:15];
    labelTitle.alpha= 1;
    [self addSubview:labelTitle];
    
    if (![BGFunctionHelper isNULLOfString:_model.contentString]) {
//        CGSize titleSize = [_model.contentString boundingRectWithSize:CGSizeMake(kScreenSize.width - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangRegularName size:12]} context:nil].size;
        
//        if (width < titleSize.width) {
//            width = titleSize.width;
//        }
        
        labelContent = [[UILabel alloc] initWithFrame:CGRectMake(15, labelTitle.allHeight + 5, width - 30, 20)];
        labelContent.text = _model.contentString;
        labelContent.font = [UIFont fontWithName:kPingFangRegularName size:12];
        labelContent.textAlignment = NSTextAlignmentCenter;
        labelContent.alpha= 0.5;
        [self addSubview:labelContent];
        
        labelTitle.textAlignment = NSTextAlignmentCenter;

    }else{
        labelContent = [[UILabel alloc] initWithFrame:CGRectMake(15, labelTitle.allHeight, 0, 0)];
        labelTitle.textAlignment = NSTextAlignmentCenter;
    }
    
    self.frame = CGRectMake(self.orginX, self.orginY, width, labelContent.allHeight + 11.5);
    
    [BorderHelper setLoginViewBorderColor:kColorFrom0x(0xf1f1f1) target:self borderWidth:1 cornerRadius:2];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.sizeWidth, self.sizeHeight)];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(chooseItemsButtonClick2:) forControlEvents:UIControlEventTouchDown];
    
    [button addTarget:self action:@selector(chooseItemsButtonClick3:) forControlEvents:UIControlEventTouchUpOutside];

    [button addTarget:self action:@selector(chooseItemsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    _findItemsBlock(self.frame);
    
    
}

- (void)chooseItemsButtonClick:(UIButton *)button{
    _findItemClickBlock(_model);
    
    UIStoryboard *storyboard = kPublicStroyboard;
    FindDetailViewController *findDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"FindDetailViewController"];
    findDetailVC.hidesBottomBarWhenPushed = YES;
    findDetailVC.type = _model.type;
    [self.viewController.navigationController pushViewController:findDetailVC animated:YES];
    self.backgroundColor = kWhiteColor;

}

- (void)chooseItemsButtonClick2:(UIButton *)button{
    self.backgroundColor = kf2f2f2;
}

- (void)chooseItemsButtonClick3:(UIButton *)button{
    self.backgroundColor = kWhiteColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
