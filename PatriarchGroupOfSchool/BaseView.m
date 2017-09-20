//
//  BaseView.m
//  AccManage
//
//  Created by 周博 on 2017/8/23.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView


- (BaseViewController *)viewController {
    UIResponder *next = self.nextResponder;
    do {
        //判断响应者是否为视图控制器
        if ([next isKindOfClass:[BaseViewController class]]) {
            return (BaseViewController *)next;
        }
        next = next.nextResponder;
    } while (next != nil);
    
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
