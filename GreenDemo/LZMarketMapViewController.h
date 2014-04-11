//
//  LZMarketMapViewController.h
//  GreenDemo
//
//  Created by Li Zeng on 3/2/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LZGlobalVars.h"

@interface LZMarketMapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mmView;
@property (nonatomic, strong) LZGlobalVars *sharedManager;

@end
