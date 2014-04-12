//
//  LZMarketInfoListDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 3/16/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#define mockItemRowNumber 8
#define mockItemSectionNumber 2

#define mockItemCellHeight 70

#define mockItemCellIdentifer @"cell"

#import "LZMarketInfoListDelegate.h"

@implementation LZMarketInfoListDelegate

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

-(NSDictionary*)loadReviewDataForKey: (NSString*) key
{
    if (!self.reviewDict) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MarketReview" ofType:@"plist"];
        self.reviewDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    return [self.reviewDict valueForKey: key];
}

#pragma UITableView Delegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZMarketCell *cell = (LZMarketCell *)[tableView dequeueReusableCellWithIdentifier: mockItemCellIdentifer];
    if (!cell) {
        cell = [[LZMarketCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mockItemCellIdentifer];
    }
    if (indexPath.section == 0) {
        //  Load Food Info
        UIImage *foodPic = [UIImage imageNamed:@"burger"];
        foodPic = [foodPic makeThumbnailOfSize:CGSizeMake(50.0f, 50.0f)];
        [cell.imageView setImage: foodPic];
        cell.imageView.layer.cornerRadius = 25.0f;
        cell.imageView.layer.masksToBounds = YES;
        cell.textLabel.text = @"On Sale";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        //  Load Reviews
        cell.userInteractionEnabled = NO;
        NSDictionary *reviewData = [self loadReviewDataForKey:self.key];
        NSInteger rowNumber = [self tableView:tableView locationForRowAtIndexPath:indexPath];
        NSString *dictKey = [NSString stringWithFormat:@"%@%ld", @"r_", (long)rowNumber];
        cell.textLabel.text = [reviewData valueForKey:dictKey];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0f];
        cell.textLabel.numberOfLines = 5;
        [cell.textLabel sizeToFit];
    }
    return cell;
}

// Set section number

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        self.sharedManager = [LZGlobalVars sharedInstance];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.foodViewController = [storyboard instantiateViewControllerWithIdentifier:@"discountViewController"];
        
        [(UINavigationController*)self.sharedManager.rootViewController pushViewController:self.foodViewController animated:YES];
    }
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"STORE";
    }else if(section == 1) {
        return @"REVIEWS";
    }
    return NULL;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return mockItemSectionNumber;
}

// Set row number

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return [[self loadReviewDataForKey: self.key] count];
    }
}

// Set cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mockItemCellHeight;
}

@end
