//
//  LZRecipeViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LZGlobalVars.h"
#import "LZRecipeListDelegate.h"

@interface LZRecipeViewController : UIViewController

@property (nonatomic, strong) UITableView* recipeList;
@property (nonatomic, strong) LZRecipeListDelegate* listDelegate;

// Global
@property (nonatomic, strong) UIViewController *myParentViewController;
@property (nonatomic, strong) LZGlobalVars *sharedManager;

@end
