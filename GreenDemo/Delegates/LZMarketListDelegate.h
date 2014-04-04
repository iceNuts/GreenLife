//
//  LZMarketListDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NS-Extension.h"
#import "LZMarketCell.h"
#import "LZGlobalVars.h"
#import "LZMarketDetailViewController.h"

@interface LZMarketListDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) LZMarketDetailViewController *marketDetail;

@property (nonatomic, strong) LZGlobalVars *sharedManager;

@property (nonatomic, strong) NSMutableDictionary *marketDict;

@property (nonatomic, strong) UIView *favorAccessoryView;

@end
