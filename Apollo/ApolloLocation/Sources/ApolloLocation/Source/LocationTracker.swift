//
//  LocationTracker.swift
//  ApolloLocation
//
//  Created by Nikola Grujic on 10/02/2023.
//

import ApolloLogger
import CoreLocation

final class LocationTracker: NSObject, CLLocationManagerDelegate, LocationTrackerProtocol, LoggerInjected {
    private let locationManager = CLLocationManager()
    private var locations: [CLLocation] = []
    var updatingLocationStopped = true

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    // MARK: - LocationTrackerProtocol

    func requestAuthorization() {
        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        updatingLocationStopped = false
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        updatingLocationStopped = true
    }

    func calculateDistance() -> Double {
        var distance = 0.0

        if locations.isEmpty {
            return distance
        }

        for i in 1 ... locations.count - 1 {
            let currentLocation = locations[i - 1]
            let nextLocation = locations[i]

            distance += currentLocation.distance(from: nextLocation)
        }

        return distance
    }

    func clear() {
        locations.removeAll()
    }

    func addLocation(_ location: CLLocation) {
        locations.append(location)
    }

    // MARK: - CLLocationManagerDelegate methods

    // Tells the delegate its authorization status when the app creates the location manager and when the authorization status changes.
    func locationManager(_: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        var statusString = ""

        switch status {
        case .restricted:
            statusString = "restricted"
        case .denied:
            statusString = "denied"
        case .notDetermined:
            statusString = "notDetermined"
        case .authorizedAlways:
            statusString = "authorizedAlways"
        case .authorizedWhenInUse:
            statusString = "authorizedWhenInUse"
        @unknown default:
            statusString = "unknown default"
        }

        logger.logInfo("CLAuthorizationStatus \(statusString)")
    }

    // Tells the delegate that the location manager was unable to retrieve a location value.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        logger.handleError(error)
    }

    // Tells the delegate that new location data is available.
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            logger.logInfo("Location updated: \(location.coordinate)")
            self.locations.append(location)
        }
    }
}
