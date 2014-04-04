//
//  LZAppDelegate.h
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LZGlobalVars.h"

@interface LZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// View Controllers
@property (strong, nonatomic) UIViewController *tabViewController;
@property (strong, nonatomic) LZSettingViewDelegate *settingDelegate;

@end
