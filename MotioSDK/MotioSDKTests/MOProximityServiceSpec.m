//
//  MOProximityServiceSpec.m
//  MotioSDK
//
//  Created by Paul Ballesty on 3/9/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "Kiwi.h"
#import <MotioSDK/MOProximityService.h>

@interface MOProximityService()
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLBeaconRegion *regionOfInterest;
@end

SPEC_BEGIN(MOProximityServiceSpec)

describe(NSStringFromClass(MOProximityService.class), ^{
    
    __block NSString *uuidString = @"D57092AC-DFAA-446C-8EF3-C81AA22815B5";
    __block MOProximityService *proximityService;
    
    beforeEach(^{
        proximityService = [[MOProximityService alloc] initWithRegion:@{MOProximityServiceUUIDKey: uuidString}];
    });
    
    it(@"should initialize the region of interest", ^{
        [[[[proximityService.regionOfInterest proximityUUID] UUIDString] should] equal:uuidString];
    });
    
});

SPEC_END
