//
//  MOBeaconDataAccumulator.h
//  MotioSDK
//
//  Created by Paul Ballesty on 3/8/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLBeacon;
@interface MOBeaconDataAccumulator : NSObject

- (void)pushRangedBeaconsData:(NSArray *)beacons;
- (CGFloat)proximityToBeacon:(CLBeacon *)beacon;

@end
