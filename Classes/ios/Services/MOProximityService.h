//
//  MOProximityService.h
//  MotioSDK
//
//  Created by Paul Ballesty on 3/8/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "MOProximityDelegate.h"
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

FOUNDATION_EXPORT NSString * const MOProximityServiceUUIDKey;
FOUNDATION_EXPORT NSString * const MOProximityServiceMajorKey;
FOUNDATION_EXPORT NSString * const MOProximityServiceMinorKey;

@interface MOProximityService : NSObject
@property (weak, nonatomic) id <MOProximityDelegate> delegate;

- (id)initWithRegion:(NSDictionary *)regionData;

- (void)startMonitoring;
- (void)stopMonitoring;
- (void)startRanging;
- (void)stopRanging;

@end
