//
//  LZGlobalVars.m
//  PokeBoard
//
//  Created by Li Zeng on 2/18/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZGlobalVars.h"

@implementation LZGlobalVars

+(id)sharedInstance
{
    static LZGlobalVars *sharedInstance = nil;
    @synchronized(self){
        if (sharedInstance == nil) {
            sharedInstance = [[LZGlobalVars alloc] init];
            sharedInstance.cartItems = [[NSMutableArray alloc] init];
        }
    }
    return sharedInstance;
}

@end
