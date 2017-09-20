//
//  AFClient.m
//  noteMan
//
//  Created by 周博 on 16/12/12.
//  Copyright © 2016年 BogoZhou. All rights reserved.
//

#import "AFClient.h"

@interface AFClient ()<NSURLSessionDelegate>
{
    NSString *_url;
    NSDictionary *_dict;
}
@end

@implementation AFClient


+(instancetype)shareInstance{
    static AFClient *defineAFClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defineAFClient = [[AFClient alloc] init];
    });
    return defineAFClient;
}

- (AFHTTPSessionManager *)creatManager{
    
    AFHTTPSessionManager* mgr = [AFHTTPSessionManager manager];
    
    //        mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO//如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    //validatesDomainName 是否需要验证域名，默认为YES；
    securityPolicy.validatesDomainName = NO;
    
    mgr.securityPolicy  = securityPolicy;
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mgr.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    return mgr;
}

- (void)requestSettingByUrl:(NSString *)url jsonString:(NSString *)jsonString progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    NSData *postData = [jsonString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:_url parameters:nil error:nil];
    request.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"Url -> %@",url);
            NSLog(@"responseObject: %@", responseObject);
            if (success) {
                success(responseObject);
            }
        } else {
            NSLog(@"error: %@, %@, %@", error, response, responseObject);
            if (failure) {
                failure(error);
            }
        }
    }] resume];
}

- (void)requestGETSettingByUrl:(NSString *)url jsonString:(NSString *)jsonString progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:_url parameters:nil error:nil];
    request.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"responseObject: %@", responseObject);
            if (success) {
                success(responseObject);
            }
        } else {
            NSLog(@"error: %@, %@, %@", error, response, responseObject);
            if (failure) {
                failure(error);
            }
        }
    }] resume];
}

#pragma mark - 名校家长圈
//获取验证码
- (void)getVerifyCodeByMobile:(NSString *)mobile progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/auth/getVerify?phone=%@",kHttpHeader,mobile];
    [self requestGETSettingByUrl:_url jsonString:nil progressBlock:progress success:success failure:failure];
}

//登录
- (void)loginByMobile:(NSString *)mobile code:(NSString *)code progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/auth/login",kHttpHeader];
    //    AFHTTPSessionManager *manager = [self creatManager];
    
    _dict = @{@"phone": mobile,
              @"number":code
              };
    
    //    NSLog(@"%@",_dict);
    
    NSString *jsonString = [_dict convertToJsonData];
    
    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];

//    AFHTTPSessionManager *manager = [self creatManager];
//    
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
//    
//    [dict setValue:mobile forKey:@"mobile"];
//    [dict setValue:@"code" forKey:@"code"];
//
//    [manager POST:_url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
//        if (progress) {
//            progress(uploadProgress);
//        }
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"Url -> %@",_url);
//        NSLog(@"responseObject: %@", dic);
//        if (success) {
//            success(dic);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error: %@", error);
//        if (failure) {
//            failure(error);
//        }
//    }];
    

}

#pragma mark - Verson 1
//获取登录accessCode
//pay.ae-pay.com
//-(void)getAccessCodeByAccount:(NSString *)account password:(NSString *)password progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/auth/getVerify?phone=%@",kHttpHeader,];
//    
//    _dict = @{@"account": account,
//              @"password":password
//              };
//    
////    NSLog(@"%@",_dict);
//    
//    NSString *jsonString = [_dict convertToJsonData];
//
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//    
//}

//传入接口1获取的accessCode换取token
- (void)getTokenAndLoginByAccessCode:(NSString *)accessCode merchant:(NSString *)merchant progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/v1/login/getAccessToken/%@",kHttpHeader,accessCode];
  
    [self requestSettingByUrl:_url jsonString:merchant progressBlock:progress success:success failure:failure];
}

//修改密码
- (void)changePasswordByOldPassword:(NSString *)oldPassword password:(NSString *)password token:(NSString *)token progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/v1/login/editPassword",kHttpHeader];
    //    AFHTTPSessionManager *manager = [self creatManager];
    
    _dict = @{@"oldPassword": oldPassword,
              @"password":password,
              @"token":token
              };
    
    //    NSLog(@"%@",_dict);
    
    NSString *jsonString = [_dict convertToJsonData];
    
    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
}

//统计进件商户情况(个人)
- (void)tongjiGeRenByToken:(NSString *)token progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/v1/person/sumEntering",kHttpHeader];
    //    AFHTTPSessionManager *manager = [self creatManager];
    
    _dict = @{
//              @"accessToken":token
              };
    
    //    NSLog(@"%@",_dict);
    
    NSString *jsonString = [_dict convertToJsonData];
    
    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
}

//首页查询品牌
- (void)chaXunPinPaiByInstId:(NSString *)instId topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/v1/info/merchant/check/brand",kHttpHeader];
    //    AFHTTPSessionManager *manager = [self creatManager];
    
    _dict = @{
              @"instId" : instId,
              @"topInstId" : topInstId
              };
    
    //    NSLog(@"%@",_dict);
    
    NSString *jsonString = [_dict convertToJsonData];
    
    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
}

///v1/info/uploadImages/lz
//绿洲计划上传图片
- (void)upLoadImageInGreenPlanByFile:(UIImage *)file wxMchId:(NSString *)wxMchId topInstId:(NSString *)topInstId uploadType:(BOOL)uploadType progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/v1/info/uploadImages/lz",kHttpHeader];
    NSData *imageData = UIImageJPEGRepresentation(file, 1.0);
    
    AFHTTPSessionManager *manager = [self creatManager];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:wxMchId forKey:@"wxMchId"];
    [dict setValue:topInstId forKey:@"topInstId"];
    [dict setValue:[NSNumber numberWithBool:uploadType] forKey:@"uploadType"];
    
    [manager POST:_url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 上传文件
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat            = @"yyyyMMddHHmmss";
        NSString *str                         = [formatter stringFromDate:[NSDate date]];
        NSString *fileName               = [NSString stringWithFormat:@"%@.jpg", str];
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if (success) {
            NSLog(@"Url -> %@",_url);
            NSLog(@"responseObject: %@", dic);
            success(dic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"error: %@", error);
            failure(error);
        }
    }];

}

//上传营业执照照片
- (void)upLoadImageYingYeZhiZhaoByFile:(UIImage *)file topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/v1/info/uploadImages/business",kHttpHeader];
    NSData *imageData = UIImageJPEGRepresentation(file, 1.0);
    
    AFHTTPSessionManager *manager = [self creatManager];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    [dict setValue:topInstId forKey:@"topInstId"];

    
    [manager POST:_url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 上传文件
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat            = @"yyyyMMddHHmmss";
        NSString *str                         = [formatter stringFromDate:[NSDate date]];
        NSString *fileName               = [NSString stringWithFormat:@"%@.jpg", str];
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if (success) {
            NSLog(@"Url -> %@",_url);
            NSLog(@"responseObject: %@", dic);
            success(dic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"error: %@", error);
            failure(error);
        }
    }];
}


//查询微信,支付宝受理商接口
- (void)getShouLiShangByPayType:(NSString *)payType topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
    _url = [NSString stringWithFormat:@"%@/v1/info/merchant/query/proxyInfo",kHttpHeader];
    _dict = @{
              @"payType" : payType,
              @"topInstId" : topInstId
              };
    
    //    NSLog(@"%@",_dict);
    
    NSString *jsonString = [_dict convertToJsonData];
    
    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
}















//#pragma mark - 下面是商户管理系统的接口
//
////单店近十天统计
////%@/v2/tradeStatistic/week
//- (void)singleShopStatisticsByInstId:(NSString *)instId merNum:(NSString *)merNum payType:(NSString *)payType merStoreNo:(NSString *)merStoreNo merId:(NSString *)merId topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/v2/tradeStatistic/week",kHttpHeader];
//    
//    _dict = @{@"instId": instId,
//              @"merNum":merNum,
//              @"payType":payType,
//              @"merStoreNo": [BGFunctionHelper isNULLOfString:merStoreNo] ? @"" :merStoreNo,
//              @"merId":[BGFunctionHelper isNULLOfString:merId] ? @"" : merId,
//              @"topInstId":topInstId};
//    NSString *jsonString = [_dict convertToJsonData];
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//}
//
////连锁店今日统计
////%@/v2/tradeStatistic/today
//- (void)getShopTodayStatisticsByInstId:(NSString *)instId merNum:(NSString *)merNum payType:(NSString *)payType merStoreNo:(NSString *)merStoreNo merId:(NSString *)merId topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/v2/tradeStatistic/today",kHttpHeader];
//    
//    _dict = @{@"instId": instId,
//              @"merNum":merNum,
//              @"payType":payType,
//              @"merStoreNo": [BGFunctionHelper isNULLOfString:merStoreNo] ? @"" :merStoreNo,
//              @"merId":[BGFunctionHelper isNULLOfString:merId] ? @"" : merId,
//              @"topInstId":topInstId};
//    NSString *jsonString = [_dict convertToJsonData];
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//}
//
////连锁店历史统计
////%@/v2/tradeStatistic/history
//- (void)getShopHistoryStatisticsByInstId:(NSString *)instId merNum:(NSString *)merNum payType:(NSString *)payType merStoreNo:(NSString *)merStoreNo merId:(NSString *)merId topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/v2/tradeStatistic/history",kHttpHeader];
//    
//    _dict = @{@"instId": instId,
//              @"merNum":merNum,
//              @"payType":payType,
//              @"merStoreNo": [BGFunctionHelper isNULLOfString:merStoreNo] ? @"" :merStoreNo,
//              @"merId":[BGFunctionHelper isNULLOfString:merId] ? @"" : merId,
//              @"topInstId":topInstId};
//    NSString *jsonString = [_dict convertToJsonData];
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//}
//
////流水分页查询
////%@/v1/wxpay/trans/{merType}/{type}
//- (void)getpayPageDetailByMerType:(NSString *)merType
//                             type:(NSString *)type
//                           merNum:(NSString *)merNum
//                        topInstId:(NSString *)topInstId
//                       merStoreNo:(NSString *)merStoreNo
//                            merId:(NSString *)merId
//                            limit:(NSString *)limit
//                             page:(NSString *)page
//                      accessToken:(NSString *)accessToken
//                          payType:(NSString *)payType
//                           instId:(NSString *)instId
//                          endDate:(NSString *)endDate
//                        startDate:(NSString *)startDate
//                    progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/v1/wxpay/trans/%@/%@",kHttpHeader,merType,type];
//    
//    _dict = @{@"merNum": [BGFunctionHelper isNULLOfString:merNum] ? @"" : merNum,
//              @"topInstId":[BGFunctionHelper isNULLOfString:topInstId] ? @"" : topInstId,
//              @"payType":[BGFunctionHelper isNULLOfString:payType] ? @"" : payType,
//              @"merStoreNo": [BGFunctionHelper isNULLOfString:merStoreNo] ? @"" : merStoreNo,
//              @"merId":[BGFunctionHelper isNULLOfString:merId] ? @"" : merId,
//              @"limit":[BGFunctionHelper isNULLOfString:limit] ? @"20" : limit,
//              @"page":[BGFunctionHelper isNULLOfString:page] ? @"0" : page,
//              @"accessToken":[BGFunctionHelper isNULLOfString:accessToken] ? @"" : accessToken,
//              @"payType":[BGFunctionHelper isNULLOfString:payType] ? @"" : payType,
//              @"instId":[BGFunctionHelper isNULLOfString:instId] ? @"" : instId,
//              @"endDate":[BGFunctionHelper isNULLOfString:endDate] ? @"" : endDate,
//              @"startDate":[BGFunctionHelper isNULLOfString:startDate] ? @"" : startDate};
//    NSString *jsonString = [_dict convertToJsonData];
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//}
//
//
////商户详情
//- (void)getShopInfoByInstId:(NSString *)instId merNum:(NSString *)merNum progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/v1/get/merInfo/%@/%@",kHttpHeader,instId,merNum];
//    [self requestGETSettingByUrl:_url jsonString:nil progressBlock:progress success:success failure:failure];
//}
//
////更改密码
////%@/editPassword
//- (void)changePasswordByNewPassword:(NSString *)password oldPassword:(NSString *)oldPassword token:(NSString *)token progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/editPassword",kHttpHeader];
//    
//    _dict = @{@"password": password,
//              @"oldPassword":oldPassword,
//              @"token":token};
//    NSString *jsonString = [_dict convertToJsonData];
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//}
//
////查询版本
////%@/get/appVersion/{topInstId}
//- (void)getVersonByTopInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/get/appVersion/%@",kHttpHeader,topInstId];
//    [self requestGETSettingByUrl:_url jsonString:nil progressBlock:progress success:success failure:failure];
//}
//
////查看订单详情
////%@/get/orderDetail/{payType}/{outTradeNo}/{topInstId}/{instId}
//- (void)getItemsDetailByPayType:(NSString *)payType outTradeNo:(NSString *)outTradeNo topInstId:(NSString *)topInstId instId:(NSString *)instId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/get/orderDetail/%@/%@/%@/%@",kHttpHeader,payType,outTradeNo,topInstId,instId];
////    _url = [NSString stringWithFormat:@"%@/get/orderDetail/%@/%@",payType,outTradeNo];
//
//    [self requestGETSettingByUrl:_url jsonString:nil progressBlock:progress success:success failure:failure];
//}
//
////绑定收款通知
////%@/bindNotice
//- (void)bindNotiByTopInstId:(NSString *)topInstId instId:(NSString *)instId merNum:(NSString *)merNum cid:(NSString *)cid employeeId:(NSString *)employeeId merId:(NSString *)merId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;{
//    _url = [NSString stringWithFormat:@"https://tpay.ae-pay.com/yayinclearing/bb/webapp/bindNotice"];
//    
//    _dict = @{@"topInstId": topInstId,
//              @"instId":instId,
//              @"merNum":merNum,
//              @"cid":cid,
//              @"employeeId":employeeId,
//              @"merId":merId};
//    NSString *jsonString = [_dict convertToJsonData];
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//}
//
////解绑收款通知
////%@/v2/unbindNotice/{id}
//- (void)unBindNotiByCid:(NSString *)cid progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/v2/unbindNotice/%@",kHttpHeader,cid];
//    
//    [self requestGETSettingByUrl:_url jsonString:nil progressBlock:progress success:success failure:failure];
//}
//
////查询收款通知
////%@/get/notice
//- (void)getNotiMessageByTopInstId:(NSString *)topInstId instId:(NSString *)instId merNum:(NSString *)merNum cid:(NSString *)cid accessToken:(NSString *)accessToken progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure{
//    _url = [NSString stringWithFormat:@"%@/get/notice",kHttpHeader];
//    
//    _dict = @{@"topInstId": topInstId,
//              @"instId":instId,
//              @"merNum":merNum,
//              @"cid":cid,
//              @"accessToken":accessToken};
//    NSString *jsonString = [_dict convertToJsonData];
//    [self requestSettingByUrl:_url jsonString:jsonString progressBlock:progress success:success failure:failure];
//}
@end
