//
//  LZCartListDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 4/23/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZCartListDelegate.h"

#define mockItemCellHeight 50

#define mockItemCellIdentifer @"cell"

@implementation LZCartListDelegate

#pragma UITableView Delegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZMarketCell *cell = (LZMarketCell *)[tableView dequeueReusableCellWithIdentifier: mockItemCellIdentifer];
    if (!cell) {
        cell = [[LZMarketCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mockItemCellIdentifer];
    }
    
    cell.textLabel.text = [self.sharedManager.cartItems objectAtIndex: [indexPath row]];
    cell.editingAccessoryType = UITableViewCellEditingStyleDelete;
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        [self.sharedManager.cartItems removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [[[[(UITabBarController*)self.sharedManager.tabViewController tabBar] items] objectAtIndex: 4] setBadgeValue: [NSString stringWithFormat:@"%d", (int)[self.sharedManager.cartItems count]]];
    }
    @catch (NSException *exception) {
        NSLog(@"cart item doesn't exist");
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Set row number

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.sharedManager = [LZGlobalVars sharedInstance];
    return [self.sharedManager.cartItems count];
}

// Set cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mockItemCellHeight;
}

@end
