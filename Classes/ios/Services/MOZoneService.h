//
//  MOZoneService.h
//  MotioSDK
//
//  Created by Paul Ballesty on 3/9/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "MOProximityDelegate.h"
#import <Foundation/Foundation.h>

@interface MOZoneService : NSObject <MOProximityDelegate>

- (id)initWithRegion:(NSDictionary *)regionData andZones:(NSArray *)zones;

@end
