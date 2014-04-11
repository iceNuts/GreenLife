//
//  LZMarketCell.m
//  GreenDemo
//
//  Created by Li Zeng on 2/28/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZMarketCell.h"

#define mockItemCellHeight 70


@implementation LZMarketCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

// Set up custom UI

- (void)setup
{
    // Set custom height
    [self setBounds:CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.bounds), mockItemCellHeight)];
    
    // Legacy Code
    
    /*
    // Set up elements location
    self.photImageView = [[UIImageView  alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    self.photImageView.layer.cornerRadius = 20.0f;
    self.photImageView.clipsToBounds = YES;
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 400, 40)];
    self.location = [[UILabel alloc] initWithFrame:CGRectMake(70, 50, 400, 20)];
    
    [(UILabel*)self.starCount setTextColor: [UIColor grayColor]];
    [(UILabel*)self.location setTextColor: [UIColor grayColor]];
    
    
    [self addSubview: self.photImageView];
    [self addSubview: self.name];
    [self addSubview: self.location];
     
    self.star = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width - 80, 10, 30, 20)];
    self.starCount = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 45, 15, 40, 20)];
    [self addSubview: self.star];
    [self addSubview: self.starCount];
     */
}

@end













