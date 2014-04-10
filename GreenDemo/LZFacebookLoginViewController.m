//
//  LZFacebookLoginViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 4/10/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZFacebookLoginViewController.h"

@interface LZFacebookLoginViewController ()

@end

@implementation LZFacebookLoginViewController

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
    
    self.FBLoingBtn = [[FBLoginView alloc] init];
    self.FBLoingBtn.frame = CGRectOffset(self.FBLoingBtn.frame, (self.view.center.x - (self.FBLoingBtn.frame.size.width / 2)), 500);
    [self.view addSubview: self.FBLoingBtn];
    // Set background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    
    self.delegate = [[LZFBLoginDelegate alloc] init];
    
    self.FBLoingBtn.delegate = self.delegate;
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
