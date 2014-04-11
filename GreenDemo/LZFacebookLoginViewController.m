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
        self.FBLoingBtn = [[FBLoginView alloc] initWithReadPermissions:@[@"basic_info", @"user_friends"]];
        self.delegate = [[LZFBLoginDelegate alloc] init];
        self.sharedManager = [LZGlobalVars sharedInstance];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.FBLoingBtn.frame = CGRectOffset(self.FBLoingBtn.frame, (self.view.center.x - (self.FBLoingBtn.frame.size.width / 2)), 500);
    [self.view addSubview: self.FBLoingBtn];
    self.FBLoingBtn.hidden = YES;
    
    self.FBLoingBtn.delegate = self.delegate;
    
    // Logged out
    if ([[[FBSession activeSession] accessTokenData] accessToken] == nil) {
        // Set background
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
        
        self.exitBtn.hidden = YES;
        self.UserPic.hidden = YES;
        self.UserName.hidden = YES;
        self.UserLikePic.hidden = YES;
        self.UserLikeNumber.hidden = YES;
        self.UserFriendPic.hidden = YES;
        self.UserFriendNumber.hidden = YES;
        
    }
    // Logged in
    else {
        // show user info
        UIImage *background = [UIImage imageNamed:@"wallpaper-setting-0"];
        self.view.backgroundColor = [UIColor colorWithPatternImage: background];
     
        self.exitBtn.hidden = NO;
        self.UserPic.hidden = NO;
        self.UserName.hidden = NO;
        self.UserLikePic.hidden = NO;
        self.UserLikeNumber.hidden = NO;
        self.UserFriendPic.hidden = NO;
        self.UserFriendNumber.hidden = NO;
        
        self.UserName.text = self.delegate.userName;
        self.UserFriendNumber.text = self.delegate.friendNumber;
        self.UserLikeNumber.text = [NSString stringWithFormat:@"%d", arc4random()%100];
        
        // Setup
        /*
         *  TODO
         */
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performExitAction)];
        singleTap.numberOfTapsRequired = 1;
        self.exitBtn.userInteractionEnabled = YES;
        [self.exitBtn addGestureRecognizer:singleTap];

        
    }
}

- (void)performExitAction
{
    [UIView transitionWithView: [[UIApplication sharedApplication] keyWindow]
                      duration: 1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [[[UIApplication sharedApplication] keyWindow] setRootViewController: self.sharedManager.rootViewController];
                    }
                    completion:nil
     ];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.FBLoingBtn.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSettingViewFlag:(BOOL)flag
{
    self.delegate.isSettingView = flag;
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
