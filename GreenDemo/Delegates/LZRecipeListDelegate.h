//
//  LZRecipeListDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LZReceipeCell.h"
#import "NS-Extension.h"
#import "LZRecipeDetailViewController.h"
#import "LZGlobalVars.h"

@interface LZRecipeListDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LZRecipeDetailViewController *recipeDetail;

@property (nonatomic, strong) NSDictionary *recipeDict;

@property (nonatomic, strong) LZGlobalVars *sharedManager;

@end

