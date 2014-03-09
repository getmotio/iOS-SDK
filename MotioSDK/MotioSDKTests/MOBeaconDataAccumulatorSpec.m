//
//  MOBeaconDataAccumulatorSpec.m
//  MotioSDK
//
//  Created by Paul Ballesty on 3/9/14.
//  Copyright (c) 2014 Motio. All rights reserved.
//

#import "Kiwi.h"
#import <CoreLocation/CoreLocation.h>
#import <MotioSDK/MOBeaconDataAccumulator.h>

SPEC_BEGIN(MOBeaconDataAccumulatorSpec)

describe(NSStringFromClass(MOBeaconDataAccumulator.class), ^{
    
    __block MOBeaconDataAccumulator *accumulator;
    __block CLBeacon *beacon;
    
    beforeEach(^{
       accumulator = [[MOBeaconDataAccumulator alloc] init];
        NSString *uuidString = @"D57092AC-DFAA-446C-8EF3-C81AA22815B5";
        NSNumber *major = @(1), *minor = @(2);
        beacon = [CLBeacon mock];
        [beacon stub:@selector(proximityUUID) andReturn:[[NSUUID alloc] initWithUUIDString:uuidString]];
        [beacon stub:@selector(major) andReturn:major];
        [beacon stub:@selector(minor) andReturn:minor];
        [beacon stub:@selector(accuracy) andReturn:@(0.5f)];
        [beacon stub:@selector(key) andReturn:[NSString stringWithFormat:@"%@;%@;%@", uuidString, major, minor]];
    });
    
    describe(NSStringFromSelector(@selector(proximityToBeacon:)), ^{
        
        it(@"should return unknown distance value for a not reported beacon", ^{
            [[theValue([accumulator proximityToBeacon:beacon]) should] equal:theValue(MOBeaconDataAccumulatorUnknownAccuracy)];
        });
        
        it(@"should return the average accuracy when reports don't exceed the buffer size", ^{
            for(int i = 0; i < MOBeaconDataAccumulatorBufferSize; i++) {
                [beacon stub:@selector(accuracy) andReturn:theValue((i + 1) * 1.0f)];
                [accumulator pushRangedBeaconsData:@[beacon]];
            }
            [[theValue([accumulator proximityToBeacon:beacon]) should] equal:theValue(5.5f)];
        });
        
        it(@"should return the buffer average accuracy when reports exceed the buffer size", ^{
            for(int i = 0; i < (MOBeaconDataAccumulatorBufferSize + 5); i++) {
                [beacon stub:@selector(accuracy) andReturn:theValue((i + 1) * 1.0f)];
                [accumulator pushRangedBeaconsData:@[beacon]];
            }
            [[theValue([accumulator proximityToBeacon:beacon]) should] equal:theValue(10.5f)];
        });
        
    });
    
});

SPEC_END
