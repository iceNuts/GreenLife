//
//  LZCartViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 4/23/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZGlobalVars.h"
#import "LZCartListDelegate.h"

@interface LZCartViewController : UIViewController

@property (nonatomic, strong) UITableView* itemList;
@property (nonatomic, strong) LZCartListDelegate* listDelegate;

// Global
@property (nonatomic, strong) UIViewController *myParentViewController;
@property (nonatomic, strong) LZGlobalVars *sharedManager;


@end
