//
//  FindItemsView.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/8/30.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseView.h"

@interface FindItemsModel : BaseModel

@property (nonatomic,strong) NSString *titleString;

@property (nonatomic,strong) NSString*contentString;

@property (nonatomic,strong) NSString *type;

@end

typedef void (^FindItemsViewBlock)(CGRect itemsFrame);
typedef void (^FindItemsClickBlock)(FindItemsModel *model);


@interface FindItemsView : BaseView

@property (nonatomic,assign) FindItemsViewBlock findItemsBlock;
@property (nonatomic,strong) FindItemsClickBlock findItemClickBlock;

- (instancetype)initWithFrame:(CGRect)frame findModel:(FindItemsModel *)findModel block:(FindItemsViewBlock)block clickBlock:(FindItemsClickBlock)clickBlock;

@end
