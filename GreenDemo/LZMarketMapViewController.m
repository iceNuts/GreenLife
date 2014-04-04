//
//  LZMarketMapViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 3/2/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZMarketMapViewController.h"

@interface LZMarketMapViewController ()

@end

@implementation LZMarketMapViewController

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
    self.title = @"Market Map";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone  target: self action: @selector(diminishViewControllers)];
    
    _sharedManager = [LZGlobalVars sharedInstance];
    CGFloat x = [_sharedManager contentViewX];
    CGFloat y = [_sharedManager contentViewY];
    CGFloat width = [_sharedManager naviBarWidth];
    CGFloat barHeight = [_sharedManager naviBarHeight];
    CGFloat height = self.view.frame.size.height - barHeight;
    
    self.mmView = [[MKMapView alloc] initWithFrame: CGRectMake(x, y, width, height)];
    [self.view addSubview: self.mmView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
    CLLocationCoordinate2D location = {40.6700, -73.9400};
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (location, 20000, 20000);
    [self.mmView setRegion:region animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = location;
    point.title = @"Schnuke";
    [self.mmView addAnnotation: point];
    
}


- (void)diminishViewControllers
{
    [self.parentViewController performSelector:@selector(diminishViewControllers)];
}

@end
