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
@end

@implementation MOProximityService

#pragma mark - Initializers

- (id)initWithUUID:(NSUUID *)uuid {
    self.regionOfInterest = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:MOBeaconRegionIdentifier];
    return self;
}

- (id)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major {
    self.regionOfInterest = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major identifier:MOBeaconRegionIdentifier];
    return self;
}

- (id)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor {
    self.regionOfInterest = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major minor:minor identifier:MOBeaconRegionIdentifier];
    return self;
}

@end
