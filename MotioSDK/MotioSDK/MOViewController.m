//
//  MOViewController.m
//  MotioSDK
//
//  Created by Paul Ballesty on 3/9/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "MOViewController.h"
#import <MotioSDK/MOProximityService.h>

NSString * const MODefaultUUID = @"D57092AC-DFAA-446C-8EF3-C81AA22815B5";

@interface MOViewController()
@property (strong, nonatomic) MOProximityService *proximityService;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.proximityService = [[MOProximityService alloc]
                                            initWithRegion:@{
                                                             MOProximityServiceUUIDKey: MODefaultUUID,
                                                             }];
    [self.proximityService startMonitoring];
}

@end
