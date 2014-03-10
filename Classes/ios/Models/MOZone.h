//
//  MOZone.h
//  MotioSDK
//
//  Created by Paul Ballesty on 3/9/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOZone : NSObject
@property (strong, nonatomic) NSString *beaconKey;
@property (assign, nonatomic) CGFloat immediateBorderDistance;
@property (assign, nonatomic) CGFloat nearBorderDistance;
@end
