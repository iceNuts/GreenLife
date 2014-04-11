//
//  LZSellerListDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 4/3/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZMarketCell.h"

@interface LZSellerListDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSDictionary *sellerDict;
@property (nonatomic, strong) NSDictionary *priceDict;

@end
