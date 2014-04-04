//
//  LZAppDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZAppDelegate.h"

@implementation LZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    LZGlobalVars *sharedManager = [LZGlobalVars sharedInstance];
    [sharedManager setRootViewController: self.window.rootViewController];
    
    self.tabViewController = self.window.rootViewController.childViewControllers[0];
    
    [sharedManager setTabViewController: self.tabViewController];
    
    self.settingDelegate = [[LZSettingViewDelegate alloc] init];
    
    [sharedManager setSettingViewDelegate: self.settingDelegate];
    
    // Set Avatar which is Gloabal View
    
    UIImageView *avatar = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 36, 36)];
    [avatar setImage:[UIImage imageNamed:@"user_avatar"]];
    avatar.layer.cornerRadius = 18.0f;
    avatar.clipsToBounds = YES;
    
    // Add Custom Tap
    
    [avatar setUserInteractionEnabled: YES];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self.settingDelegate action:@selector(showSettings)];
    [avatar addGestureRecognizer: singleTap];
    
    UIBarButtonItem *leftNaviButton = [[UIBarButtonItem alloc] initWithCustomView: avatar];
    
    self.tabViewController.navigationItem.leftBarButtonItem = leftNaviButton;
    
    // Get View frame
    UIView *naviBar = [(UINavigationController*)self.window.rootViewController navigationBar];
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat barHeight = naviBar.frame.size.height;
    CGFloat x = naviBar.frame.origin.x;
    CGFloat y = naviBar.frame.origin.y + barHeight + statusBarHeight;
    
    CGFloat width = self.window.rootViewController.view.frame.size.width;
    
    CGFloat tabBarHeight = 70.0f; // Cell Height
    
    [sharedManager setContentViewX: x];
    [sharedManager setContentViewY: y];
    [sharedManager setNaviBarHeight: barHeight];
    [sharedManager setNaviBarWidth: width];
    [sharedManager setStatusBarHeight: statusBarHeight];
    [sharedManager setTabBarHeight: tabBarHeight];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
