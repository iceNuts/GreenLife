//
//  LZMarketListDelegate.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#define mockItemRowNumber 8
#define mockItemSectionNumber 1

#define mockItemCellHeight 70

#define mockItemCellIdentifer @"cell"

#import "LZMarketListDelegate.h"

@interface LZMarketListDelegate()

@end

@implementation LZMarketListDelegate

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
    if (!self.marketDict) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MarketDetail" ofType:@"plist"];
        self.marketDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    NSInteger rowNumber = [self tableView:tableView locationForRowAtIndexPath:indexPath];
    
    NSString *dictName = [NSString stringWithFormat:@"%@%ld", @"market_", (long)rowNumber];
    
    return [self.marketDict valueForKey: dictName];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZMarketCell *cell = (LZMarketCell *)[tableView dequeueReusableCellWithIdentifier: mockItemCellIdentifer];
    if (!cell) {
        cell = [[LZMarketCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mockItemCellIdentifer];
    }
    
    NSDictionary *detail = [self tableView:tableView dataForRowAtIndexPath:indexPath];
    
    // Load UI
    UIImage *marketPicture = [UIImage imageNamed: [detail valueForKey:@"picture"]];
    cell.imageView.image = [marketPicture makeThumbnailOfSize: CGSizeMake(50.0f, 50.0f)];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    cell.textLabel.text = [detail valueForKey:@"title"];
    cell.detailTextLabel.text = [detail valueForKey:@"location"];
    cell.imageView.layer.cornerRadius = 25.0f;
    cell.imageView.layer.masksToBounds = YES;
    
    // Setup accessory view
    self.favorAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
//    self.favorAccessoryView.backgroundColor = [UIColor grayColor];
    UIImageView *likeBtn = [[UIImageView alloc] initWithFrame: CGRectMake(5, 10, 15, 15)];
    UILabel *likeCount = [[UILabel alloc] initWithFrame:CGRectMake(25, 10, 55, 15)];
    
    likeCount.font = [UIFont systemFontOfSize:10.0f];

    if ([[detail valueForKey:@"marked"] boolValue]) {
        likeBtn.image = [UIImage imageNamed:@"mark"];
        likeCount.textColor = [UIColor blueColor];
        likeCount.text = [NSString stringWithFormat:@"%@ %@",[detail valueForKey:@"star_count"], @"liked!"];
    } else {
        likeBtn.image = [UIImage imageNamed:@"unmark"];
        likeCount.textColor = [UIColor grayColor];
        likeCount.text = [NSString stringWithFormat:@"%@ %@",[detail valueForKey:@"star_count"], @"likes"];
    }
    // Enable Touch Event
    likeBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateLikeStatus:)];
    [likeBtn addGestureRecognizer: singleTap];
    likeBtn.tag = [self tableView:tableView locationForRowAtIndexPath:indexPath];
    
    [self.favorAccessoryView addSubview: likeCount];
    [self.favorAccessoryView addSubview: likeBtn];
    
    cell.accessoryView = self.favorAccessoryView;
        
    return cell;
}

#pragma Like Button Click Event

- (void)updateLikeStatus:(id) sender
{
    NSInteger tag = [(UIGestureRecognizer *)sender view].tag;
    NSString *dictName = [NSString stringWithFormat:@"%@%ld", @"market_", (long)tag];
    
    NSMutableDictionary *market = [self.marketDict objectForKey: dictName];
    
    BOOL isAdd = NO;
    
    if ([[market valueForKey:@"marked"] boolValue] == YES) {
        [market setValue:[NSNumber numberWithBool: NO] forKey:@"marked"];
    }else{
        isAdd = YES;
        [market setValue:[NSNumber numberWithBool: YES] forKey:@"marked"];
    }
    NSInteger count = [[market valueForKey:@"star_count"] integerValue];
    if (!isAdd) {
        if (count > 0) {
            count--;
        } else {
            count = 0;
        }
    } else {
        count++;
    }
    [market setValue:[NSString stringWithFormat:@"%ld", (long)count] forKey:@"star_count"];
    
    [self.marketDict setObject:market forKey:dictName];
    
    [self writeToMarketPlist];
    
    self.sharedManager = [LZGlobalVars sharedInstance];
    UIViewController *mainThreadTopViewController = [(UITabBarController*)[self.sharedManager tabViewController] selectedViewController];
    // Ignore Warning
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        [mainThreadTopViewController performSelector:@selector(reloadTableViewData)];
#pragma clang diagnostic pop
}

#pragma Refresh PLIST

- (void)writeToMarketPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MarketDetail" ofType:@"plist"];
    if (!self.marketDict) {
        self.marketDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    [self.marketDict writeToFile: filePath atomically:YES];
}

#pragma UITableView Delegate

// Select CallBack

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Load Data
    NSDictionary *detail = [self tableView:tableView dataForRowAtIndexPath:indexPath];
    self.marketDetail = [[LZMarketDetailViewController alloc] initWithNibName: nil bundle: nil];
    UIImage *marketPic = [UIImage imageNamed:[detail valueForKey:@"picture"]];
    marketPic = [marketPic makeThumbnailOfSize:CGSizeMake(80.0f, 80.0f)];
    self.marketDetail.photo = marketPic;
    if ([[detail valueForKey:@"marked"] boolValue] == YES) {
        self.marketDetail.likePic = [UIImage imageNamed:@"mark"];
        self.marketDetail.likeLabelHidden = NO;
    } else {
        self.marketDetail.likePic = [UIImage imageNamed:@"unmark"];
        self.marketDetail.likeLabelHidden = YES;
    }
    
    self.marketDetail.name = [detail valueForKey:@"title"];
    self.marketDetail.location = [detail valueForKey:@"location"];
    
    // Presenting Market Details
    self.sharedManager = [LZGlobalVars sharedInstance];
    [(UINavigationController*)[self.sharedManager rootViewController] pushViewController:self.marketDetail animated:YES];
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
