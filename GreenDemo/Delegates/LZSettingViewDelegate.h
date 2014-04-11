//
//  LZSettingViewDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZFacebookLoginViewController.h"
#import "LZGlobalVars.h"

@interface LZSettingViewDelegate : NSObject

@property (nonatomic, strong) LZGlobalVars *sharedManager;

- (void)showSettings;

@end
