//
//  LZVegetableDetailViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 3/17/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZContentBaseViewController.h"
#import "LZSellerListDelegate.h"

@interface LZVegetableDetailViewController : LZContentBaseViewController

@property (nonatomic, strong) LZSellerListDelegate *sellerListDelegate;

@property (nonatomic, strong) UIStoryboard *myStoryboard;

@property (weak, nonatomic) IBOutlet UIImageView *foodPhoto;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodDescription;
@property (weak, nonatomic) IBOutlet UITableView *sellerList;
@property (weak, nonatomic) IBOutlet UIImageView *starRateImageView;

@property (nonatomic, strong) UIImage *picture;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *starRate;
@property (nonatomic, strong) NSDictionary *sellerDict;
@property (nonatomic, strong) NSDictionary *priceDict;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSString *foodInfo;

@end
