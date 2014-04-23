//
//  LZCartListDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 4/23/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZGlobalVars.h"
#import "LZMarketCell.h"

@interface LZCartListDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) LZGlobalVars *sharedManager;

@end
