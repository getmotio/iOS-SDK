//
//  MOProximityDelegate.h
//  MotioSDK
//
//  Created by Paul Ballesty on 3/10/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MOProximityDelegate <NSObject>
- (void)beaconsDetected:(NSDictionary *)beacons;
@end
