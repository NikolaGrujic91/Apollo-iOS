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

extension LocationTrackerInjected {
    public var locationTracker: LocationTrackerProtocol {
        return LocationTrackerInjectionMap.locationTracker
    }
}
