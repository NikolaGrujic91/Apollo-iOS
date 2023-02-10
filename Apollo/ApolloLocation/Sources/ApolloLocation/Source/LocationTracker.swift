//
//  LocationTracker.swift
//  ApolloLocation
//
//  Created by Nikola Grujic on 10/02/2023.
//

import CoreLocation
import ApolloLogger

class LocationTracker: NSObject, CLLocationManagerDelegate, LocationTrackerProtocol, LoggerInjected {
    private let locationManager = CLLocationManager()
    private var locations: [CLLocation] = []
    var updatingLocationStopped = true

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
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

        for i in 0..<locations.count - 1 {
            let currentLocation = self.locations[i]
            let nextLocation = self.locations[i + 1]

            distance += nextLocation.distance(from: currentLocation)
        }

        return distance
    }

    func clear() {
        locations.removeAll()
    }

    // MARK: - CLLocationManagerDelegate methods

    // Tells the delegate its authorization status when the app creates the location manager and when the authorization status changes.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        var statusString: String = ""

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
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            logger.logInfo("Location updated: \(location.coordinate)")
            self.locations.append(location)
        }
    }
}
