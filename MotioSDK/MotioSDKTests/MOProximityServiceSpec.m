//
//  MOProximityServiceSpec.m
//  MotioSDK
//
//  Created by Paul Ballesty on 3/9/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "Kiwi.h"
#import <MotioSDK/MOProximityService.h>
#import <MotioSDK/MOBeaconDataAccumulator.h>

@interface MOProximityService()
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLBeaconRegion *regionOfInterest;
@property (strong, nonatomic) MOBeaconDataAccumulator *beaconDataAccumulator;

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region;
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
    
    describe(NSStringFromSelector(@selector(startMonitoring)), ^{
       
        beforeEach(^{
            [proximityService stopMonitoring];
        });
        
        it(@"should start monitoring the region of interest", ^{
            [proximityService.locationManager stub:@selector(startMonitoringForRegion:) withBlock:^id(NSArray *params) {
                [[params[0] should] equal:proximityService.regionOfInterest];
                return nil;
            }];
            [proximityService startMonitoring];
        });
        
        it(@"should not start again if it is already monitoring", ^{
            [[proximityService.locationManager should] receive:@selector(startMonitoringForRegion:) withCount:1];
            [proximityService startMonitoring];
            [proximityService startMonitoring];
        });
        
    });
    
    describe(NSStringFromSelector(@selector(stopMonitoring)), ^{
       
        beforeEach(^{
            [proximityService startMonitoring];
        });
        
        it(@"should stop monitoring the region of interest", ^{
            [proximityService.locationManager stub:@selector(stopMonitoringForRegion:) withBlock:^id(NSArray *params) {
                [[params[0] should] equal:proximityService.regionOfInterest];
                return nil;
            }];
            [proximityService stopMonitoring];
        });
        
        it(@"should not stop again if it is already stopped", ^{
            [[proximityService.locationManager should] receive:@selector(stopMonitoringForRegion:) withCount:1];
            [proximityService stopMonitoring];
            [proximityService stopMonitoring];
        });
        
    });
    
    describe(NSStringFromSelector(@selector(startRanging)), ^{
        
        beforeEach(^{
            [proximityService stopRanging];
        });
        
        it(@"should start ranging the region of interest", ^{
            [proximityService.locationManager stub:@selector(startRangingBeaconsInRegion:) withBlock:^id(NSArray *params) {
                [[params[0] should] equal:proximityService.regionOfInterest];
                return nil;
            }];
            [proximityService startRanging];
        });
        
        it(@"should not start again if it is already ranging", ^{
            [[proximityService.locationManager should] receive:@selector(startRangingBeaconsInRegion:) withCount:1];
            [proximityService startRanging];
            [proximityService startRanging];
        });
        
    });
    
    describe(NSStringFromSelector(@selector(stopRanging)), ^{
        
        beforeEach(^{
            [proximityService startRanging];
        });
        
        it(@"should stop ranging the region of interest", ^{
            [proximityService.locationManager stub:@selector(stopRangingBeaconsInRegion:) withBlock:^id(NSArray *params) {
                [[params[0] should] equal:proximityService.regionOfInterest];
                return nil;
            }];
            [proximityService stopRanging];
        });
        
        it(@"should not start again if it is already ranging", ^{
            [[proximityService.locationManager should] receive:@selector(stopRangingBeaconsInRegion:) withCount:1];
            [proximityService stopRanging];
            [proximityService stopRanging];
        });
        
    });
    
    describe(NSStringFromSelector(@selector(locationManager:didRangeBeacons:inRegion:)), ^{
        
        __block NSArray *beacons = @[[CLBeacon nullMock], [CLBeacon nullMock], [CLBeacon nullMock]];
        
        it(@"should add the data to the accumulator", ^{
            [proximityService.beaconDataAccumulator stub:@selector(pushRangedBeaconsData:) withBlock:^id(NSArray *params) {
                [[params[0] should] equal:beacons];
                return nil;
            }];
            [proximityService locationManager:proximityService.locationManager didRangeBeacons:beacons inRegion:proximityService.regionOfInterest];
        });
        
    });
    
});

SPEC_END
