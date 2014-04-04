//
//  LZFoodDiscountListDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 4/4/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#define mockItemRowNumber 8
#define mockItemSectionNumber 1

#define mockItemCellHeight 70

#define mockItemCellIdentifer @"cell"

#import "LZFoodDiscountListDelegate.h"
#import "NS-Extension.h"

@implementation LZFoodDiscountListDelegate

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
    LZMarketCell *cell = (LZMarketCell *)[tableView dequeueReusableCellWithIdentifier: mockItemCellIdentifer];
    if (!cell) {
        cell = [[LZMarketCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mockItemCellIdentifer];
    }
    
    int rowNumber = (int)[self tableView:tableView locationForRowAtIndexPath:indexPath];
    NSDictionary *vege = [self.foodDict valueForKeyPath:[NSString stringWithFormat:@"%@%d", @"vegetable_", rowNumber]];
    
    UIImage *foodPicture = [UIImage imageNamed: [vege valueForKey:@"picture"]];
    cell.imageView.image = [foodPicture makeThumbnailOfSize: CGSizeMake(50.0f, 50.0f)];
    cell.imageView.layer.cornerRadius = 25.0f;
    cell.imageView.clipsToBounds = YES;
    
    NSDictionary *sellerDict = [vege valueForKeyPath:@"seller"];
    NSDictionary *priceDict = [vege valueForKeyPath:@"price"];
    NSString *seller = [sellerDict valueForKeyPath:@"s_0"];
    NSString *price = [priceDict valueForKeyPath:@"p_0"];
    NSString *discount = [vege valueForKeyPath:@"discount"];
    
    cell.textLabel.text = [vege valueForKeyPath:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@%@%@%@%@%@", price, @"$", @" @ ", seller, @"    ", discount, @"OFF"];
    cell.detailTextLabel.textColor = [UIColor redColor];
    
    // Add shopping cart
    UIButton *buyButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    [buyButton setImage:[UIImage imageNamed:@"basket_dark"] forState:UIControlStateNormal];
    [buyButton setImage:[UIImage imageNamed:@"basket_glow"] forState:UIControlStateSelected];
    [buyButton addTarget:self action:@selector(purchaseAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = buyButton;
    return cell;
}

- (void)purchaseAction:(id) sender
{
    UIButton *button = (UIButton*)sender;
    button.selected = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return mockItemSectionNumber;
}

// Set row number

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.foodDict count];
}

// Set cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mockItemCellHeight;
}


@end
