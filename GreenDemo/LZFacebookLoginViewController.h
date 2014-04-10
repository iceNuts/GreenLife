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

@interface LZFacebookLoginViewController : UIViewController

@property (strong, nonatomic) FBLoginView *FBLoingBtn;
@property (strong, nonatomic) LZFBLoginDelegate *delegate;

@end
