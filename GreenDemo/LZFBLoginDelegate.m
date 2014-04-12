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
        if (!self.isSettingView) {
            [[[UIApplication sharedApplication] keyWindow] setRootViewController: self.sharedManager.rootViewController];
        }
    }
    // Do nothing, because it may not have parent controller;
    @catch (NSException * e) {
        
    }
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    self.userName = user.name;
    FBRequest* friendsRequest = [FBRequest requestForMyFriends];
    [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
                                                  NSDictionary* result,
                                                  NSError *error) {
        NSArray* friends = [result objectForKey:@"data"];
        self.friendNumber = [NSString stringWithFormat:@"%d", (int)[friends count]];
    }];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.isSettingView = NO;
    [[FBSession activeSession] closeAndClearTokenInformation];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

    [self.sharedManager.FBLoginViewController performSelector: @selector(hideAllView)];

#pragma clang diagnostic pop

}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    // pass
}


@end
