//
//  LocationTrackerProtocol.swift
//  FoundationLocation
//
//  Created by Nikola Grujic on 10/02/2023.
//

import CoreLocation

public protocol LocationTrackerProtocol: AnyObject {
    var updatingLocationStopped: Bool { get }

    var distanceMeters: Double { get }

    var distanceKilometers: Double { get }

    func requestAuthorization()

    func startUpdatingLocation()

    func stopUpdatingLocation()

    func clear()

    func update(_ location: CLLocation)
}
