//
//  LZRecipeDetailViewController.m
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZRecipeDetailViewController.h"

@interface LZRecipeDetailViewController ()

@end

@implementation LZRecipeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self = [self.myStoryboard instantiateViewControllerWithIdentifier: @"LZRecipeDetail"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Test
    //self.loadURL = @"http://m.allrecipes.com/recipe/44839/chris-bay-area-burger";
    [self.detailWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: self.loadURL]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
