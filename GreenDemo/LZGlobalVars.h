//
//  LZGlobalVars.h
//  PokeBoard
//
//  Created by Li Zeng on 2/18/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZSettingViewDelegate.h"

@interface LZGlobalVars : NSObject
{
    UIViewController *_rootViewController;
    UIViewController *_tabViewController;
    CGFloat _contentViewX;
    CGFloat _contentViewY;
    CGFloat _naviBarHeight;
    CGFloat _naviBarWidth;
    CGFloat _statusBarHeight;
    CGFloat _cellHeight;
    
    LZSettingViewDelegate *_settingViewDelegate;
    UIViewController *_FBLoginViewController;
    
}

@property (strong, nonatomic) UIViewController *rootViewController;
@property (strong, nonatomic) UIViewController *tabViewController;
@property (nonatomic) CGFloat contentViewX;
@property (nonatomic) CGFloat contentViewY;
@property (nonatomic) CGFloat naviBarHeight;
@property (nonatomic) CGFloat naviBarWidth;
@property (nonatomic) CGFloat statusBarHeight;
@property (nonatomic) CGFloat cellHeight;
@property (nonatomic) CGFloat tabBarHeight;

@property (strong, nonatomic) LZSettingViewDelegate *settingViewDelegate;
@property (strong, nonatomic) UIViewController *FBLoginViewController;


+(id)sharedInstance;

@end
