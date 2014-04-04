//
//  LZSalesViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZSalesViewController.h"

@interface LZSalesViewController ()

@end

@implementation LZSalesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _sharedManager = [LZGlobalVars sharedInstance];
    self.myParentViewController = [_sharedManager tabViewController];
    self.delegate = [[LZFoodDiscountListDelegate alloc] init];
    self.discountFoodList.delegate = self.delegate;
    self.discountFoodList.dataSource = self.delegate;
    
    // Load Dictionary
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"VegetableDetail" ofType:@"plist"];
    self.delegate.foodDict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.myParentViewController.title = @"Discount";
    self.myParentViewController.navigationItem.rightBarButtonItem = nil;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
