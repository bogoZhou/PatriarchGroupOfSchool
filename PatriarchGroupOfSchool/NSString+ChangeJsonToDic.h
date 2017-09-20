//
//  NSString+ChangeJsonToDic.h
//  BusinessAccountingSystem
//
//  Created by 周博 on 2017/5/5.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChangeJsonToDic)
- (NSDictionary *)dictionaryWithJsonString;
- (NSString *)checkNull;
- (NSString *)base64DecodedString;
@end
