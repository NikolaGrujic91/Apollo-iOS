//
//  LocationTrackerProtocol.swift
//  ApolloLocation
//
//  Created by Nikola Grujic on 10/02/2023.
//

public protocol LocationTrackerProtocol {
    var updatingLocationStopped: Bool { get }

    func requestAuthorization()

    func startUpdatingLocation()

    func stopUpdatingLocation()

    func calculateDistance() -> Double

    func clear()
}
