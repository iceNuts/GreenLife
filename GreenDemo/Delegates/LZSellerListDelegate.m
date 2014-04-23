//
//  LZSellerListDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 4/3/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#define mockItemRowNumber 8
#define mockItemSectionNumber 1

#define mockItemCellHeight 70

#define mockItemCellIdentifer @"cell"


#import "LZSellerListDelegate.h"

@implementation LZSellerListDelegate

#pragma Mock Data Methods

-(NSInteger)tableView:(UITableView *)tableView locationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowNumber = 0;
    for (NSInteger i = 0; i < indexPath.section; i++) {
        rowNumber += [self tableView:tableView numberOfRowsInSection:i];
    }
    rowNumber += indexPath.row;
    return rowNumber;
}

#pragma UITableView Delegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.sharedManager = [LZGlobalVars sharedInstance];
    LZMarketCell *cell = (LZMarketCell *)[tableView dequeueReusableCellWithIdentifier: mockItemCellIdentifer];
    if (!cell) {
        cell = [[LZMarketCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mockItemCellIdentifer];
    }
    
    int rowNumber = (int)[self tableView:tableView locationForRowAtIndexPath:indexPath];
    cell.textLabel.text = [self.sellerDict valueForKeyPath:[NSString stringWithFormat:@"%@%d",@"s_", rowNumber, nil]];
    cell.detailTextLabel.text = [[self.priceDict valueForKeyPath:[NSString stringWithFormat:@"%@%d", @"p_", rowNumber, nil]] stringByAppendingString:@"$"];
    
    UIButton *buyButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    [buyButton setImage:[UIImage imageNamed:@"basket_dark"] forState:UIControlStateNormal];
    [buyButton setImage:[UIImage imageNamed:@"basket_glow"] forState:UIControlStateSelected];
    [buyButton addTarget:self action:@selector(purchaseAction:) forControlEvents:UIControlEventTouchUpInside];
    [buyButton setTag: rowNumber];
    cell.accessoryView = buyButton;
    return cell;
}

- (void)purchaseAction:(id) sender
{
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
    if (button.selected == YES) {
        [self.sharedManager.cartItems addObject: self.foodName];
    }
    else {
        for (id obj in self.sharedManager.cartItems) {
            if ([self.foodName isEqualToString:obj])
            {
                [self.sharedManager.cartItems removeObject: obj];
                break;
            }
        }
    }
    [[[[(UITabBarController*)self.sharedManager.tabViewController tabBar] items] objectAtIndex: 4] setBadgeValue: [NSString stringWithFormat:@"%d", (int)[self.sharedManager.cartItems count]]];
}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"STORE";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return mockItemSectionNumber;
}

// Set row number

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sellerDict count];
}

// Set cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mockItemCellHeight;
}


@end
