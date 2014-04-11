//
//  LZRecipeListDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#define mockItemRowNumber 4
#define mockItemSectionNumber 1

#define mockItemCellHeight 70

#define mockItemCellIdentifer @"cell"

#import "LZRecipeListDelegate.h"

@implementation LZRecipeListDelegate

// Method to load mock data

-(NSDictionary*)tableView:(UITableView *)tableView dataForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.recipeDict) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"RecipeDetail" ofType:@"plist"];
        self.recipeDict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    NSInteger rowNumber = 0;
    for (NSInteger i = 0; i < indexPath.section; i++) {
        rowNumber += [self tableView:tableView numberOfRowsInSection:i];
    }
    rowNumber += indexPath.row;
    
    NSString *dictName = [NSString stringWithFormat:@"%@%ld", @"recipe_", (long)rowNumber];
    
    return [self.recipeDict valueForKey: dictName];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZReceipeCell *cell = (LZReceipeCell *)[tableView dequeueReusableCellWithIdentifier: mockItemCellIdentifer];
    if (!cell) {
        cell = [[LZReceipeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mockItemCellIdentifer];
    }
    
    NSDictionary *detail = [self tableView:tableView dataForRowAtIndexPath:indexPath];
    
    // Load UI
    UIImage *foodPicture = [UIImage imageNamed: [detail valueForKey:@"picture"]];
    cell.imageView.image = [foodPicture makeThumbnailOfSize: CGSizeMake(50.0f, 50.0f)];
    cell.textLabel.text = [detail valueForKey:@"title"];
    cell.detailTextLabel.text = [detail valueForKey:@"detail"];
    cell.imageView.layer.cornerRadius = 25.0f;
    cell.imageView.layer.masksToBounds = YES;
    
    return cell;
}

#pragma UITableView Delegate

// Select CallBack

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Presenting Market Details
    self.recipeDetail = [[LZRecipeDetailViewController alloc] initWithNibName: nil bundle: nil];
    NSDictionary *detail = [self tableView:tableView dataForRowAtIndexPath:indexPath];
    self.recipeDetail.loadURL = [detail valueForKey:@"url"];
    self.sharedManager = [LZGlobalVars sharedInstance];
    [(UINavigationController*)[self.sharedManager rootViewController] pushViewController:self.recipeDetail animated:YES];
    
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
