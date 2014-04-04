//
//  LZRecipeViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZRecipeViewController.h"

@interface LZRecipeViewController ()

@end

@implementation LZRecipeViewController

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
    
    // Set Navi Bar
    
    _sharedManager = [LZGlobalVars sharedInstance];
    self.myParentViewController = [_sharedManager tabViewController];
    
    // Market List
    self.listDelegate = [[LZRecipeListDelegate alloc] init];
    CGFloat x = [_sharedManager contentViewX];
    CGFloat y = [_sharedManager contentViewY];
    CGFloat width = [_sharedManager naviBarWidth];
    CGFloat barHeight = [_sharedManager naviBarHeight];
    CGFloat height = self.view.frame.size.height - barHeight;
    self.recipeList = [[UITableView alloc] initWithFrame: CGRectMake(x, y, width, height)];
    
    self.recipeList.delegate = self.listDelegate;
    self.recipeList.dataSource = self.listDelegate;
    
    self.recipeList.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
    
    [self.view addSubview: self.recipeList];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.myParentViewController.title = @"Recipe";
    self.myParentViewController.navigationItem.rightBarButtonItem = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
