//
//  MOZoneService.m
//  MotioSDK
//
//  Created by Paul Ballesty on 3/9/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "MOZoneService.h"
#import "MOProximityService.h"
#import "MOZone.h"

NSString * const MOZoneServiceImmediateBorderKey = @"MOZoneServiceImmediateDistanceKey";
NSString * const MOZoneServiceNearBorderKey = @"MOZoneServiceNearDistanceKey";

@interface MOZoneService()
@property (strong, nonatomic) MOProximityService *proximityService;
@property (strong, nonatomic) NSMutableDictionary *zones;
@end

@implementation MOZoneService

- (id)initWithRegion:(NSDictionary *)regionData andZones:(NSArray *)zones {
    self = [super init];
    if (self) {
        self.proximityService = [[MOProximityService alloc] initWithRegion:regionData];
        self.proximityService.delegate = self;
        self.zones = [[NSMutableDictionary alloc] init];
        for (MOZone *zone in zones) {
            [self.zones setObject:@{
                                    MOZoneServiceImmediateBorderKey: @(zone.immediateBorderDistance),
                                    MOZoneServiceNearBorderKey: @(zone.nearBorderDistance)
                                    }
                           forKey:zone.beaconKey
             ];
        }
    }
    return self;
}

#pragma mark - MOProximityDelegate

- (void)beaconsDetected:(NSDictionary *)beacons {
    
}

@end
