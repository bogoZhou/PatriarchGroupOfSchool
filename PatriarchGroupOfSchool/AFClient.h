//
//  AFClient.h
//  noteMan
//
//  Created by 周博 on 16/12/12.
//  Copyright © 2016年 BogoZhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#if 0
//线下

#define kHttpHeader @"https://tpay.ae-pay.com/yayin/mmsapp"
//https://192.168.16.134
#else
//线上
//https:// 139.196.18.81/truelies_video
#define kHttpHeader @"http://101.132.71.121:8080"
#endif
@interface AFClient : NSObject

typedef void(^ProgressBlock)(NSProgress *progress);
typedef void(^SuccessBlock)(id responseBody);
typedef void(^FailureBlcok)(NSError *error);

@property (nonatomic,strong)ProgressBlock progressBolck;
@property (nonatomic,strong)SuccessBlock successBlock;
@property (nonatomic,strong)FailureBlcok failureBlock;


+(instancetype)shareInstance;

#pragma mark - Verson 1

//获取登录accessCode
-(void)getAccessCodeByAccount:(NSString *)account password:(NSString *)password progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

//传入接口1获取的accessCode换取token
- (void)getTokenAndLoginByAccessCode:(NSString *)accessCode merchant:(NSString *)merchant progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

//修改密码
- (void)changePasswordByOldPassword:(NSString *)oldPassword password:(NSString *)password token:(NSString *)token progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

//统计进件商户情况(个人)
- (void)tongjiGeRenByToken:(NSString *)token progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

//首页查询品牌
- (void)chaXunPinPaiByInstId:(NSString *)instId topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

///v1/info/uploadImages/lz
//绿洲计划上传图片
- (void)upLoadImageInGreenPlanByFile:(UIImage *)file wxMchId:(NSString *)wxMchId topInstId:(NSString *)topInstId uploadType:(BOOL)uploadType progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

//上传营业执照照片
- (void)upLoadImageYingYeZhiZhaoByFile:(UIImage *)file topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

//查询微信,支付宝受理商接口
- (void)getShouLiShangByPayType:(NSString *)payType topInstId:(NSString *)topInstId progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

#pragma mark - 名校家长圈
//获取验证码
- (void)getVerifyCodeByMobile:(NSString *)mobile progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

//登录
- (void)loginByMobile:(NSString *)mobile code:(NSString *)code progressBlock:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlcok)failure;

@end
