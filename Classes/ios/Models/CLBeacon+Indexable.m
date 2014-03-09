//
//  CLBeacon+Indexable.m
//  MotioSDKTest
//
//  Created by Paul Ballesty on 3/8/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "CLBeacon+Indexable.h"

NSString * const MOBeaconKeyFormat = @"%@;%@;%@";

@implementation CLBeacon (Indexable)

- (NSString *)key {
    return [NSString stringWithFormat:MOBeaconKeyFormat, [self.proximityUUID UUIDString], self.major, self.minor];
}

@end
