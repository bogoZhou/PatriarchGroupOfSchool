//
//  FindDetailViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@interface FindDetailModel : BaseModel

@property (nonatomic,strong) NSString * name;

@property (nonatomic,strong) NSString *collectionName;

@property (nonatomic,strong) NSString *collectionNumber;

@property (nonatomic,strong) NSString *likeNumber;

@property (nonatomic,strong) NSString *memberNumber;

@property (nonatomic,strong) NSString *showQuan;

@property (nonatomic,strong) NSString *showGroup;

@property (nonatomic,strong) NSArray *groups;

@end

@interface FindDetailViewController : BaseViewController

@property (strong, nonatomic)  UIScrollView *scrollView;

@property (nonatomic,strong) NSString *type;

@end
