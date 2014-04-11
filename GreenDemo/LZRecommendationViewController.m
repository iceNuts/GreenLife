//
//  LZSecondViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZRecommendationViewController.h"

@interface LZRecommendationViewController ()

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
    self.myParentViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"SIRI" style:UIBarButtonItemStylePlain target:self action:@selector(launchSiri)];
}

- (void)launchSiri {
    [self simulateTouchEvent: kGSEventMenuButtonDown];
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self simulateTouchEvent: kGSEventMenuButtonUp];
    });
}

- (void)simulateTouchEvent: (GSEventType)type
{
    struct GSEventRecord record;
    memset(&record, 0, sizeof(record));
    record.type = type;
    record.timestamp = GSCurrentEventTimestamp();
    GSSendSystemEvent(&record);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
