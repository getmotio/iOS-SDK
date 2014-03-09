//
//  MOBeaconDataAccumulator.m
//  MotioSDK
//
//  Created by Paul Ballesty on 3/8/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "MOBeaconDataAccumulator.h"
#import "CLBeacon+Indexable.h"
#import <CoreLocation/CoreLocation.h>

NSInteger const MOBeaconDataAccumulatorBufferSize = 10;

@interface MOBeaconDataAccumulator()
@property (strong, nonatomic) NSMutableDictionary *beaconAccuracyBuffers;
@property (strong, nonatomic) NSMutableDictionary *beaconAccuracyTotals;
@property (strong, nonatomic) NSMutableDictionary *beaconAccuracyAvg;
@end

@implementation MOBeaconDataAccumulator

- (id)init
{
    self = [super init];
    if (self) {
        self.beaconAccuracyBuffers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)pushRangedBeaconsData:(NSArray *)beacons {
    for (CLBeacon *beacon in beacons) {
        [self pushBeaconData:beacon];
    }
}

- (NSMutableArray *)accuracyBufferFor:(CLBeacon *)beacon {
    NSMutableArray *accuracyBuffer = [self.beaconAccuracyBuffers objectForKey:beacon.key];
    if (accuracyBuffer) {
        accuracyBuffer = [[NSMutableArray alloc] initWithCapacity:MOBeaconDataAccumulatorBufferSize];
        [self.beaconAccuracyBuffers setObject:accuracyBuffer forKey:beacon.key];
    }
    return accuracyBuffer;
}

- (void)pushBeaconData:(CLBeacon *)beacon {
    NSMutableArray *accuracyBuffer = [self accuracyBufferFor:beacon];
    [accuracyBuffer addObject:@(beacon.accuracy)];
    NSNumber *total = [self.beaconAccuracyTotals objectForKey:beacon.key];
    
    if (!total) {
        total = @(beacon.accuracy);
    } else {
        total = @([total floatValue] + beacon.accuracy);
    }
    
    if ([accuracyBuffer count] > MOBeaconDataAccumulatorBufferSize) {
        total = @([total floatValue] - [[accuracyBuffer firstObject] floatValue]);
        [accuracyBuffer removeObjectAtIndex:0];
    }
    
    [self.beaconAccuracyTotals setObject:total forKey:beacon.key];
    [self.beaconAccuracyAvg setObject:@([total floatValue] / [accuracyBuffer count]) forKey:beacon.key];
}

- (CGFloat)proximityToBeacon:(CLBeacon *)beacon {
    return [[self.beaconAccuracyAvg objectForKey:beacon.key] floatValue];
}

@end
