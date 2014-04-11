//
//  LZSettingViewDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZSettingViewDelegate.h"

@implementation LZSettingViewDelegate

- (void)showSettings
{
    self.sharedManager = [LZGlobalVars sharedInstance];
    [(LZFacebookLoginViewController*)self.sharedManager.FBLoginViewController setSettingViewFlag: YES];
    
    [UIView transitionWithView: [[UIApplication sharedApplication] keyWindow]
                      duration: 1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [[[UIApplication sharedApplication] keyWindow] setRootViewController: self.sharedManager.FBLoginViewController];
                    }
                    completion:nil
     ];
    
}

@end
