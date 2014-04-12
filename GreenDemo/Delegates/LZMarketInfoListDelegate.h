//
//  LZMarketInfoListDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 3/16/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZMarketCell.h"
#import "NS-Extension.h"
#import "LZSalesViewController.h"
#import "LZGlobalVars.h"

@interface LZMarketInfoListDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSDictionary *reviewDict;
@property (nonatomic, strong) LZSalesViewController *foodViewController;
@property (nonatomic, strong) LZGlobalVars *sharedManager;

@end
