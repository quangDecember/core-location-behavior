//
//  CLMissingDelegate.swift
//  core-location-framework
//
//  Created by Ha, Quang on 2018/11/18.
//  Copyright © 2018 Ha, Quang. All rights reserved.
//

import Foundation
import CoreLocation

@objc public class CLMissingDelegate1 : NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @objc public override init() {
        super.init()
        locationManager.delegate = self
    }
    @objc public func requestLocation() {
        locationManager.requestLocation()
    }
    @objc public func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
}

@objc public class CLNoMissingDelegate: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @objc public override init() {
        super.init()
        locationManager.delegate = self
    }
    @objc public func requestLocation() {
        locationManager.requestLocation()
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}

@objc public class CLMissingSomeDelegate: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @objc public override init() {
        super.init()
        locationManager.delegate = self
    }
    @objc public func requestLocation() {
        locationManager.requestLocation()
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}

