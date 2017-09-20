//
//  FindView.m
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "FindView.h"

@interface FindView ()
{
    CGFloat orginx;
    CGFloat orginy;
    CGFloat width;
    CGFloat height;
    CGFloat line;
    NSString *_name;
}
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation FindView

- (instancetype)initWithFrame:(CGRect)frame viewName:(NSString *)viewName array:(NSMutableArray *)array block:(FindViewBlock)block clickBlock:(FindItemsClickBlock)clickBlock
{
    _findItemClickBlock = clickBlock;
    _name = viewName;
    _findViewBlock = block;
    _dataArray = array;
    self = [super initWithFrame:frame];
    if (self) {
//        [self creatSubView];
        [self creatEqualSubView];
    }
    return self;
}

- (void)creatSubView{
    
    UILabel *titelLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 15, self.sizeWidth, 15)];
    titelLabel.text = _name;
    titelLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeSmall];
    titelLabel.alpha = 1;
    [self addSubview:titelLabel];
    
    orginx = 25;
    orginy = 10 + titelLabel.allHeight;
    line = 1;
    for (NSInteger i = 0 ; i < _dataArray.count; i ++) {
        FindItemsModel *model = _dataArray[i];
        FindItemsView *findItemView = [[FindItemsView alloc] initWithFrame:CGRectMake(25, 10, 0, 0) findModel:model block:^(CGRect itemsFrame) {
            
            if (self.sizeWidth - orginx  - 25 - 10 < itemsFrame.size.width) {
                line ++;
                orginx = 25;
                orginy = orginy + height + 10;
                height = 0;
            }
            
            findItemView.frame = CGRectMake(orginx, orginy, itemsFrame.size.width, itemsFrame.size.height);
            
            if (height < itemsFrame.size.height) {
                height = itemsFrame.size.height;
            }
            
        } clickBlock:^(FindItemsModel *model) {
//            NSLog(@"clickName -> %@",model.titleString);
            _findItemClickBlock(model);
        }];
        
        findItemView.frame = CGRectMake(orginx, orginy, findItemView.frame.size.width, findItemView.frame.size.height);
        orginx = orginx + findItemView.frame.size.width + 10;
        [self addSubview:findItemView];
    }
    NSLog(@"orginY -> %lf",height);
    self.frame = CGRectMake(self.orginX, self.orginY, self.sizeWidth, orginy + height + 25);
    _findViewBlock(self.frame);
    
}

- (void)creatEqualSubView{
    
    UILabel *titelLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 15, self.sizeWidth, 15)];
    titelLabel.text = _name;
    titelLabel.font = [UIFont fontWithName:kPingFangMediumName size:kfontSizeSmall];
    titelLabel.alpha = 1;
    [self addSubview:titelLabel];
    
    orginx = 25;
    orginy = 20 + titelLabel.allHeight;
//    line = 1;
    for (NSInteger i = 0 ; i < _dataArray.count; i ++) {
        FindItemsModel *model = _dataArray[i];
        FindItemsView *findItemView = [[FindItemsView alloc] initWithFrame:CGRectMake(25, 10, 0, 0) findModel:model block:^(CGRect itemsFrame) {
            
            if (i%3 == 0) {
                line ++;
                orginx = 25;
                orginy = orginy + height + 10;
                height = 0;
            }
            
            
            findItemView.frame = CGRectMake(orginx, orginy, itemsFrame.size.width, itemsFrame.size.height);
            
            if (height < itemsFrame.size.height) {
                height = itemsFrame.size.height;
            }
            
        } clickBlock:^(FindItemsModel *model) {
            //            NSLog(@"clickName -> %@",model.titleString);
            _findItemClickBlock(model);
        }];
        
        findItemView.frame = CGRectMake(orginx, orginy, findItemView.frame.size.width, findItemView.frame.size.height);
        orginx = orginx + findItemView.frame.size.width + 10;
        [self addSubview:findItemView];
    }
    NSLog(@"orginY -> %lf",height);
    self.frame = CGRectMake(self.orginX, self.orginY, self.sizeWidth, orginy + height + 25);
    _findViewBlock(self.frame);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
