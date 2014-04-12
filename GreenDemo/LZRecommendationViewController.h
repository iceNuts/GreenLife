//
//  LZSecondViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LZVegetableListDelegate.h"
#import "LZGlobalVars.h"

@interface LZRecommendationViewController : UIViewController

// Vegetable List
@property (nonatomic, strong) UITableView* vegetableList;
@property (nonatomic, strong) LZVegetableListDelegate* listDelegate;

// Global
@property (nonatomic, strong) UIViewController *myParentViewController;
@property (nonatomic, strong) LZGlobalVars *sharedManager;

@end
