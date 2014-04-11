//
//  LZFacebookLoginViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 4/10/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "LZFBLoginDelegate.h"
#import "NS-Extension.h"
#import "LZGlobalVars.h"

@interface LZFacebookLoginViewController : UIViewController

@property (strong, nonatomic) FBLoginView *FBLoingBtn;
@property (strong, nonatomic) LZFBLoginDelegate *delegate;
@property (strong, nonatomic) LZGlobalVars *sharedManager;

// IBOutlet View

@property (strong, nonatomic) IBOutlet UIImageView *UserPic;
@property (strong, nonatomic) IBOutlet UILabel *UserName;
@property (strong, nonatomic) IBOutlet UIImageView *UserFriendPic;
@property (strong, nonatomic) IBOutlet UILabel *UserFriendNumber;
@property (strong, nonatomic) IBOutlet UIImageView *UserLikePic;
@property (strong, nonatomic) IBOutlet UILabel *UserLikeNumber;
@property (strong, nonatomic) IBOutlet UIImageView *exitBtn;



- (void)setSettingViewFlag:(BOOL)flag;

@end
