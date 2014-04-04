//
//  LZMMBaseViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 3/2/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZMMBaseViewController.h"

@interface LZMMBaseViewController ()

@end

@implementation LZMMBaseViewController

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
    LZMarketMapViewController *mmViewController = [[LZMarketMapViewController alloc] init];
    [self pushViewController:mmViewController animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)diminishViewControllers
{
    [self popViewControllerAnimated: NO];
    [self dismissViewControllerAnimated: YES completion: nil];
}

@end
