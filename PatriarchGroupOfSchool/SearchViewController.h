//
//  SearchViewController.h
//  PatriarchGroupOfSchool
//
//  Created by 周博 on 2017/9/12.
//  Copyright © 2017年 BogoZhou. All rights reserved.
//

#import "BaseViewController.h"

@protocol SearchViewControllerDelegate <NSObject>

- (void)sendValueWithNameToChooseSchool:(NSString *)schoolName;

@end

@interface SearchViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UITextField *textFieldSearch;

@property (strong, nonatomic) IBOutlet UIButton *buttonSearch;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) id<SearchViewControllerDelegate> delegate;

@property (nonatomic,strong) NSString *fromId;

@end
