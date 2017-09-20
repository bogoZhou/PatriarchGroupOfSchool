//
//  TakePicDelegate.h
//  SuperStudent_Teacher
//
//  Created by 周博 on 16/5/11.
//  Copyright © 2016年 BogoZhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TakePicDelegateDelegate <NSObject>

- (void)getShopChooseImage:(UIImage *)image;

@end

@interface TakePicDelegate : NSObject
{
    
}

+ (TakePicDelegate *)defaultManager;

@property (nonatomic,strong) UIViewController *mainController;

@property (nonatomic,strong) NSString *typeValue;

- (void)jumpAlarmInViewController:(UIViewController *)VC notiName:(NSString *)notiName type:(NSString *)type;

- (void)jumpAlarmInViewController:(UIViewController *)VC type:(NSString *)type delegate:(id<TakePicDelegateDelegate>)delegate;
-(void)takePhoto;

-(void)LocalPhoto;

- (void)setMainController:(UIViewController *)mainController notiName:(NSString *)notiName;

@property (nonatomic,assign) id<TakePicDelegateDelegate> delegate;

@end
