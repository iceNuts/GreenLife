//
//  LZVegetableDetailViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 3/17/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZVegetableDetailViewController.h"

@interface LZVegetableDetailViewController ()

@end

@implementation LZVegetableDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self = [self.myStoryboard instantiateViewControllerWithIdentifier: @"LZVegetableDetail"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.foodPhoto setImage:self.picture];
    [self.starRateImageView setImage: self.starRate];
    [self.foodDescription setText: self.foodInfo];
    [self.foodName setText: self.name];
    self.sellerListDelegate = [[LZSellerListDelegate alloc] init];
    self.sellerList.delegate = self.sellerListDelegate;
    self.sellerList.dataSource = self.sellerListDelegate;
    self.sellerListDelegate.sellerDict = self.sellerDict;
    self.sellerListDelegate.priceDict = self.priceDict;
    self.sellerListDelegate.foodName = self.foodName.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
