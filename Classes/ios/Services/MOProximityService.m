//
//  MOProximityService.m
//  
//
//  Created by Paul Ballesty on 3/6/14.
//
//

#import "MOProximityService.h"

NSString * const MOBeaconRegionIdentifier = @"RegionOfInterest";

@interface MOProximityService()
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLBeaconRegion *regionOfInterest;
@property (assign, nonatomic) BOOL monitoring;
@property (assign, nonatomic) BOOL ranging;
@end

@implementation MOProximityService

#pragma mark - Initializers

- (id)initWithUUID:(NSUUID *)uuid {
    [self initialize];
    self.regionOfInterest = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:MOBeaconRegionIdentifier];
    return self;
}

- (id)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major {
    [self initialize];
    self.regionOfInterest = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major identifier:MOBeaconRegionIdentifier];
    return self;
}

- (id)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor {
    [self initialize];
    self.regionOfInterest = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major minor:minor identifier:MOBeaconRegionIdentifier];
    return self;
}

- (void)initialize {
    self.monitoring = NO;
    self.ranging = NO;
}

#pragma mark - Controls

- (void)startMonitoring {
    if (!self.monitoring) {
        self.monitoring = YES;
        [self.locationManager startMonitoringForRegion:self.regionOfInterest];
    }
}

- (void)stopMonitoring {
    if (self.monitoring) {
        self.monitoring = NO;
        [self.locationManager stopMonitoringForRegion:self.regionOfInterest];
    }
}

- (void)startRanging {
    if (!self.ranging) {
        self.ranging = YES;
        [self.locationManager startRangingBeaconsInRegion:self.regionOfInterest];
    }
}

- (void)stopRanging {
    if (self.ranging) {
        self.ranging = NO;
        [self.locationManager stopRangingBeaconsInRegion:self.regionOfInterest];
    }
}

@end
