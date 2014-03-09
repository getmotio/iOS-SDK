//
//  MOProximityService.m
//  
//
//  Created by Paul Ballesty on 3/6/14.
//
//

#import "MOProximityService.h"

NSString * const MOBeaconRegionIdentifier = @"RegionOfInterest";

NSString * const MOProximityServiceUUIDKey = @"MOProximityServiceUUIDKey";
NSString * const MOProximityServiceMajorKey = @"MOProximityServiceMajorKey";
NSString * const MOProximityServiceMinorKey = @"MOProximityServiceMinorKey";

@interface MOProximityService() <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLBeaconRegion *regionOfInterest;
@property (assign, nonatomic) BOOL monitoring;
@property (assign, nonatomic) BOOL ranging;
@end

@implementation MOProximityService

#pragma mark - Initializers

- (id)init {
    return [self initWithRegion:@{}];
}

- (id)initWithRegion:(NSDictionary *)regionData {
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.monitoring = NO;
        self.ranging = NO;
        NSString *uuidString = [regionData valueForKey:MOProximityServiceUUIDKey];
        NSNumber *major = [regionData valueForKey:MOProximityServiceMajorKey];
        NSNumber *minor = [regionData valueForKey:MOProximityServiceMinorKey];
        CLBeaconRegion *region = [CLBeaconRegion alloc];
        if (uuidString) {
            NSUUID * uuid = [[NSUUID alloc] initWithUUIDString:uuidString];
            if (major && minor) {
                region = [region initWithProximityUUID:uuid major:[major integerValue] minor:[minor integerValue] identifier:MOBeaconRegionIdentifier];
                NSLog(@"%@ - Initialized <%@, %@, %@>", MOProximityService.class, uuidString, major, minor);
            } else if (major) {
                region = [region initWithProximityUUID:uuid major:[major integerValue] identifier:MOBeaconRegionIdentifier];
                NSLog(@"%@ - Initialized <%@, %@>", MOProximityService.class, uuidString, major);
            } else {
                region = [region initWithProximityUUID:uuid identifier:MOBeaconRegionIdentifier];
                NSLog(@"%@ - Initialized <%@>", MOProximityService.class, uuidString);
            }
        } else {
            NSLog(@"%@ - Invalid initialization", MOProximityService.class);
        }
        self.regionOfInterest = region;
    }
    return self;
}

#pragma mark - Controls

- (void)startMonitoring {
    if (!self.monitoring) {
        self.monitoring = YES;
        [self.locationManager startMonitoringForRegion:self.regionOfInterest];
        NSLog(@"%@ - Monitoring Started", MOProximityService.class);
    }
}

- (void)stopMonitoring {
    if (self.monitoring) {
        self.monitoring = NO;
        [self.locationManager stopMonitoringForRegion:self.regionOfInterest];
        NSLog(@"%@ - Monitoring Stopped", MOProximityService.class);
    }
}

- (void)startRanging {
    if (!self.ranging) {
        self.ranging = YES;
        [self.locationManager startRangingBeaconsInRegion:self.regionOfInterest];
        NSLog(@"%@ - Ranging Started", MOProximityService.class);
    }
}

- (void)stopRanging {
    if (self.ranging) {
        self.ranging = NO;
        [self.locationManager stopRangingBeaconsInRegion:self.regionOfInterest];
        NSLog(@"%@ - Ranging Stopped", MOProximityService.class);
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    NSLog(@"Beacons: %@", beacons);
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    [self startRanging];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    [self stopRanging];
}

@end
