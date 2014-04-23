//
//  LZCartViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 4/23/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZCartViewController.h"

@interface LZCartViewController ()

@end

@implementation LZCartViewController

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
    // Set Navi Bar
    
    _sharedManager = [LZGlobalVars sharedInstance];
    self.myParentViewController = [_sharedManager tabViewController];
    
    // Market List
    self.listDelegate = [[LZCartListDelegate alloc] init];
    CGFloat x = [_sharedManager contentViewX];
    CGFloat y = [_sharedManager contentViewY];
    CGFloat width = [_sharedManager naviBarWidth];
    CGFloat barHeight = [_sharedManager naviBarHeight];
    CGFloat height = self.view.frame.size.height - barHeight;
    self.itemList = [[UITableView alloc] initWithFrame: CGRectMake(x, y, width, height)];
    
    self.itemList.delegate = self.listDelegate;
    self.itemList.dataSource = self.listDelegate;
    
    self.itemList.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
        
    [self.view addSubview: self.itemList];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.itemList reloadData];
    self.myParentViewController.title = @"Cart";
    self.myParentViewController.navigationItem.rightBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
