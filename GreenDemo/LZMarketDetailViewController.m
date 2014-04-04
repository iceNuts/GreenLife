//
//  LZMarketDetailViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 3/3/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZMarketDetailViewController.h"

@interface LZMarketDetailViewController ()

@end

@implementation LZMarketDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self = [self.myStoryboard instantiateViewControllerWithIdentifier: @"LZMarketDetail"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.photoImageView setImage:self.photo];
    [self.likePic makeThumbnailOfSize:CGSizeMake(30.0f, 30.0f)];
    [self.likeBtn setImage: self.likePic];
    [self.likeLabel setText: self.likeLabelHidden? @"like?" : @"liked!"];
    [self.likeLabel setTextColor: self.likeLabelHidden? [UIColor grayColor] : [UIColor blueColor]];
    [self.marketName setText: self.name];
    [self.marketAddress setText: self.location];
    
    // Load market reviews
    self.listDelegate = [[LZMarketInfoListDelegate alloc] init];
    self.marketInfoList.delegate = self.listDelegate;
    self.marketInfoList.dataSource = self.listDelegate;
    self.listDelegate.key = self.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
