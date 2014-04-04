//
//  LZRecipeDetailViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZContentBaseViewController.h"

@interface LZRecipeDetailViewController : LZContentBaseViewController

@property (nonatomic, strong) UIStoryboard *myStoryboard;

@property (weak, nonatomic) IBOutlet UIWebView *detailWebView;

@property (nonatomic, strong) NSString *loadURL;

@end
