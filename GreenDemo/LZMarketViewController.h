//
//  LZFirstViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LZMarketListDelegate.h"
#import "LZGlobalVars.h"
#import "LZMarketMapViewController.h"
#import "LZMMBaseViewController.h"

@interface LZMarketViewController : UIViewController

@property (nonatomic, strong) UITableView* marketList;
@property (nonatomic, strong) LZMarketListDelegate* listDelegate;

// Global
@property (nonatomic, strong) UIViewController *myParentViewController;
@property (nonatomic, strong) LZGlobalVars *sharedManager;

// ViewControllers
@property (nonatomic, strong) LZMMBaseViewController *mmViewController; // Map View Controller

- (void)reloadTableViewData;

@end
