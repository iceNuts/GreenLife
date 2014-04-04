//
//  LZFirstViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZMarketViewController.h"

@interface LZMarketViewController ()

@end

@implementation LZMarketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set Navi Bar
    
    _sharedManager = [LZGlobalVars sharedInstance];
    self.myParentViewController = [_sharedManager tabViewController];
    
    // Market List
    self.listDelegate = [[LZMarketListDelegate alloc] init];
    CGFloat x = [_sharedManager contentViewX];
    CGFloat y = [_sharedManager contentViewY];
    CGFloat width = [_sharedManager naviBarWidth];
    CGFloat barHeight = [_sharedManager naviBarHeight];
    CGFloat tabBarHeight = [_sharedManager tabBarHeight];
    CGFloat height = self.view.frame.size.height - barHeight - tabBarHeight;
    self.marketList = [[UITableView alloc] initWithFrame: CGRectMake(x, y, width, height)];
        
    self.marketList.delegate = self.listDelegate;
    self.marketList.dataSource = self.listDelegate;
    
    self.marketList.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
    
    [self.view addSubview: self.marketList];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.myParentViewController.title = @"Market";
    UIImageView *mapImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paper_plane_black"]];
    [mapImageView setBounds:CGRectMake(0, 0, 22, 22)];
    
    // Add Custom Tap
    
    [mapImageView setUserInteractionEnabled: YES];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMapView)];
    [mapImageView addGestureRecognizer: singleTap];
    
    self.parentViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: mapImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma MapView methods

- (void)showMapView
{
    NSLog(@"showMapView Action");
    // Set up Map ViewController
    self.mmViewController = [[LZMMBaseViewController alloc] init];
    [self presentViewController:self.mmViewController animated:YES completion:nil];
}

#pragma Reload TableView

- (void)reloadTableViewData
{
    [self.marketList reloadData];
}

@end





