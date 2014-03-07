//
//  MOProximityService.h
//  
//
//  Created by Paul Ballesty on 3/6/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MOProximityService : NSObject

- (id)initWithUUID:(NSUUID *)uuid;
- (id)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major;
- (id)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor;

@end
