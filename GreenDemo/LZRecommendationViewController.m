//
//  LZSecondViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZRecommendationViewController.h"
#import <Foundation/Foundation.h>

@interface LZRecommendationViewController ()

@end

/*
 *  Jailbroken Only
 */
@interface CPDistributedMessagingCenter
+ (id)centerNamed:(id)arg1;
- (BOOL)sendMessageName:(id)arg1 userInfo:(id)arg2;
- (void)runServerOnCurrentThread;
- (void)registerForMessageName:(id)arg1 target:(id)arg2 selector:(SEL)arg3;
- (id)sendMessageAndReceiveReplyName:(id)arg1 userInfo:(id)arg2;
@end

@implementation LZRecommendationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set Navi Bar
    
    _sharedManager = [LZGlobalVars sharedInstance];
    self.myParentViewController = [_sharedManager tabViewController];
    
    // Market List
    self.listDelegate = [[LZVegetableListDelegate alloc] init];
    CGFloat x = [_sharedManager contentViewX];
    CGFloat y = [_sharedManager contentViewY];
    CGFloat width = [_sharedManager naviBarWidth];
    CGFloat barHeight = [_sharedManager naviBarHeight];
    CGFloat height = self.view.frame.size.height - barHeight;
    self.vegetableList = [[UITableView alloc] initWithFrame: CGRectMake(x, y, width, height)];
    
    self.vegetableList.delegate = self.listDelegate;
    self.vegetableList.dataSource = self.listDelegate;
    
    self.vegetableList.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
    
    [self.view addSubview: self.vegetableList];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.myParentViewController.title = @"Recommendations";
    self.myParentViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(launchSiri)];
}


/*
 * Jailbroken Only
 */
- (void)launchSiri
{
    /* install the dylib for jailbroken device */
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Siri" message:@"Siri is only supported on a jailbroken phone. Jailbreak your phone and install the deb package in the project folder. Siri will be with you :-)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
