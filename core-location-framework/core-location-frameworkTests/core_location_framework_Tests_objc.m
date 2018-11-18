//
//  core_location_framework_Tests_objc.m
//  core_location_framework-Tests-objc
//
//  Created by Ha, Quang on 2018/11/18.
//  Copyright © 2018 Ha, Quang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <core_location_framework/core_location_framework-Swift.h>

@interface core_location_framework_Tests_objc : XCTestCase

@end

@implementation core_location_framework_Tests_objc

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testMissingDelegate {
    @try {
        CLMissingDelegate1 * case1 = [[CLMissingDelegate1 alloc] init];
        [case1 requestLocation];
        XCTFail();
    } @catch (NSException *exception) {
        if ([exception.name isEqualToString:NSInternalInconsistencyException])
        {
            return;
        }
    }
    @try {
        CLMissingDelegate1 * case1 = [[CLMissingDelegate1 alloc] init];
        [case1 startUpdatingLocation];
    } @catch (NSException *exception) {
        XCTFail();
    }
}

-(void) testEnoughDelegate {
    @try {
        CLNoMissingDelegate * case1 = [[CLNoMissingDelegate alloc] init];
        [case1 requestLocation];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
        XCTFail();
    }
}

- (void)testMissingSomeDelegate {
    XCTestExpectation* missingDelegateException = [[XCTestExpectation alloc] initWithDescription:@"Missing one of the delegate will throw NSInternalInconsistencyException"];
    @try {
        CLMissingSomeDelegate * case1 = [[CLMissingSomeDelegate alloc] init];
        [case1 requestLocation];
        XCTFail();
    } @catch (NSException *exception) {
        if ([exception.name isEqualToString:NSInternalInconsistencyException])
        {
            [missingDelegateException fulfill];
        }
    }
    
    XCTestExpectation* throwNoException = [[XCTestExpectation alloc] initWithDescription:@"startUpdatinglocation will not throw exception when missing Delegates"];
    @try {
        CLMissingDelegate1 * case1 = [[CLMissingDelegate1 alloc] init];
        [case1 startUpdatingLocation];
        [throwNoException fulfill];
    } @catch (NSException *exception) {
        XCTFail();
    }
}

@end
