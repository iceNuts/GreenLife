//
//  LZSalesViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZGlobalVars.h"
#import "LZFoodDiscountListDelegate.h"

@interface LZSalesViewController : UIViewController

// Global
@property (nonatomic, strong) UIViewController *myParentViewController;
@property (nonatomic, strong) LZGlobalVars *sharedManager;

// Discount Food List

@property (weak, nonatomic) IBOutlet UITableView *discountFoodList;
@property (strong, nonatomic) LZFoodDiscountListDelegate *delegate;

@end
