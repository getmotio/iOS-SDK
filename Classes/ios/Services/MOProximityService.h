//
//  MOProximityService.h
//  
//
//  Created by Paul Ballesty on 3/6/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

FOUNDATION_EXPORT NSString * const MOProximityServiceUUIDKey;
FOUNDATION_EXPORT NSString * const MOProximityServiceMajorKey;
FOUNDATION_EXPORT NSString * const MOProximityServiceMinorKey;

@interface MOProximityService : NSObject

- (id)initWithRegion:(NSDictionary *)regionData;

- (void)startMonitoring;
- (void)stopMonitoring;
- (void)startRanging;
- (void)stopRanging;

@end
