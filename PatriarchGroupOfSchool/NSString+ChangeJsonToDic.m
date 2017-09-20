//
//  NSString+ChangeJsonToDic.m
//  BusinessAccountingSystem
//
//  Created by 周博 on 2017/5/5.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "NSString+ChangeJsonToDic.h"

@implementation NSString (ChangeJsonToDic)

- (NSDictionary *)dictionaryWithJsonString
{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (NSString *)checkNull{
    if ([BGFunctionHelper isNULLOfString:self]) {
        NSString *stirng = @"";
        return stirng;
    }else{
        return self;
    }
}

- (NSString *)base64DecodedString
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


@end
