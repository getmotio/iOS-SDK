//
//  MOViewController.m
//  MotioSDKTest
//
//  Created by Paul Ballesty on 3/8/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "MOViewController.h"
#import <MotioSDK/MOProximityService.h>

NSString * const MODefaultUUID = @"D57092AC-DFAA-446C-8EF3-C81AA22815B5";

@interface MOViewController()
@property MOProximityService *proximityService;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.proximityService = [[MOProximityService alloc] initWithRegion:@{
                                                                         MOProximityServiceUUIDKey: MODefaultUUID,
                                                                         }];
    [self.proximityService startMonitoring];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
