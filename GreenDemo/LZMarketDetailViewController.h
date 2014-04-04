//
//  LZMarketDetailViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 3/3/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NS-Extension.h"
#import "LZContentBaseViewController.h"
#import "LZMarketInfoListDelegate.h"

@interface LZMarketDetailViewController : LZContentBaseViewController

@property (nonatomic, strong) UIStoryboard *myStoryboard;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *likeBtn;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketName;
@property (weak, nonatomic) IBOutlet UILabel *marketAddress;
@property (weak, nonatomic) IBOutlet UITableView *marketInfoList;

@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) UIImage *likePic;
@property (nonatomic) BOOL likeLabelHidden;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* location;

@property (nonatomic, strong) LZMarketInfoListDelegate *listDelegate;

@end
