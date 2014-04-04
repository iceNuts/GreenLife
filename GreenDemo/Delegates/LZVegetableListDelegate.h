//
//  LZVegetableListDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LZGlobalVars.h"
#import "LZVegetableCell.h"
#import "NS-Extension.h"
#import "LZVegetableDetailViewController.h"

@interface LZVegetableListDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) LZGlobalVars *sharedManager;

@property (nonatomic, strong) NSMutableDictionary *vegetableDict;

@property (nonatomic, strong) LZVegetableDetailViewController *vegetableDetail;

@end
