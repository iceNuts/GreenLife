//
//  LZVegetableListDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#define mockItemRowNumber 8
#define mockItemSectionNumber 1

#define mockItemCellHeight 70

#define mockItemCellIdentifer @"cell"

#import "LZVegetableListDelegate.h"

@implementation LZVegetableListDelegate

#pragma Mock Data Methods

// Method to load mock data

-(NSInteger)tableView:(UITableView *)tableView locationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowNumber = 0;
    for (NSInteger i = 0; i < indexPath.section; i++) {
        rowNumber += [self tableView:tableView numberOfRowsInSection:i];
    }
    rowNumber += indexPath.row;
    return rowNumber;
}

-(NSDictionary*)tableView:(UITableView *)tableView dataForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.vegetableDict) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"VegetableDetail" ofType:@"plist"];
        self.vegetableDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    NSInteger rowNumber = mockItemRowNumber - 1 - [self tableView:tableView locationForRowAtIndexPath:indexPath];
    
    NSString *dictName = [NSString stringWithFormat:@"%@%ld", @"vegetable_", (long)rowNumber];
    
    return [self.vegetableDict valueForKey: dictName];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZVegetableCell *cell = (LZVegetableCell *)[tableView dequeueReusableCellWithIdentifier: mockItemCellIdentifer];
    if (!cell) {
        cell = [[LZVegetableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mockItemCellIdentifer];
    }
    
    NSDictionary *detail = [self tableView:tableView dataForRowAtIndexPath:indexPath];
    
    UIImage *foodPic = [UIImage imageNamed:[detail valueForKeyPath:@"picture"]];
    foodPic = [foodPic makeThumbnailOfSize:CGSizeMake(50.0f, 50.0f)];
    [cell.imageView setImage: foodPic];
    cell.imageView.layer.cornerRadius = 25.0f;
    cell.imageView.layer.masksToBounds = YES;
    cell.textLabel.text = [detail valueForKeyPath:@"name"];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@%@", @"Discount: ", [detail valueForKeyPath:@"discount"], @" Off"];
    cell.detailTextLabel.text = [detail valueForKeyPath:@"description"];
    
    return cell;
    
}

#pragma UITableView Delegate

// Select CallBack

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Load Data
    self.vegetableDetail = [[LZVegetableDetailViewController alloc] initWithNibName: nil bundle: nil];
    NSDictionary *vegeDict = [self tableView:tableView dataForRowAtIndexPath:indexPath];
    self.vegetableDetail.picture = [UIImage imageNamed:[vegeDict valueForKey:@"picture"]];
    self.vegetableDetail.name = [vegeDict valueForKey:@"name"];
    self.vegetableDetail.starRate = [UIImage imageNamed:[vegeDict valueForKey:@"star_rate"]];
    self.vegetableDetail.sellerDict = [vegeDict valueForKey:@"seller"];
    self.vegetableDetail.priceDict = [vegeDict valueForKey:@"price"];
    self.vegetableDetail.discount = [vegeDict valueForKey:@"discount"];
    self.vegetableDetail.foodInfo = [vegeDict valueForKey:@"description"];
    // Presenting Market Details
    self.sharedManager = [LZGlobalVars sharedInstance];
    [(UINavigationController*)[self.sharedManager rootViewController] pushViewController:self.vegetableDetail animated:YES];
    
}

// Set section number

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return mockItemSectionNumber;
}

// Set row number

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mockItemRowNumber;
}

// Set cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mockItemCellHeight;
}

@end
