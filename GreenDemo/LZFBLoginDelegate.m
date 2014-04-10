//
//  LZFBLoginDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 4/10/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZFBLoginDelegate.h"

@implementation LZFBLoginDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    // Restore Normal View
    self.sharedManager = [LZGlobalVars sharedInstance];
    
    @try
    {
        [[[UIApplication sharedApplication] keyWindow] setRootViewController: self.sharedManager.rootViewController];
    }
    // Do nothing, because it may not have parent controller;
    @catch (NSException * e) {
        
    }
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    
}


@end
