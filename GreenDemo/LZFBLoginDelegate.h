//
//  LZFBLoginDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 4/10/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "LZGlobalVars.h"

@interface LZFBLoginDelegate : NSObject <FBLoginViewDelegate>

@property (nonatomic, strong) LZGlobalVars *sharedManager;

@end
