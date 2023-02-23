//
//  LocationTrackerInjected.swift
//  ApolloLocation
//
//  Created by Nikola Grujic on 10/02/2023.
//

enum LocationTrackerInjectionMap {
    static var locationTracker: LocationTrackerProtocol = LocationTracker()
}

public protocol LocationTrackerInjected: AnyObject {}

public extension LocationTrackerInjected {
    var locationTracker: LocationTrackerProtocol {
        LocationTrackerInjectionMap.locationTracker
    }
}
