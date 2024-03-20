//
//  LocationTrackerInjected.swift
//  FoundationLocation
//
//  Created by Nikola Grujic on 10/02/2023.
//

@MainActor
enum LocationTrackerInjectionMap {
    static var locationTracker: LocationTrackerProtocol = LocationTracker()
}

public protocol LocationTrackerInjected: AnyObject {}

@MainActor
public extension LocationTrackerInjected {
    var locationTracker: LocationTrackerProtocol {
        LocationTrackerInjectionMap.locationTracker
    }
}
