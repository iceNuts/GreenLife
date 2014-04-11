//
//  LZFoodDiscountListDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 4/4/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZMarketCell.h"

@interface LZFoodDiscountListDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *foodDict;

@end
