//
//  LocationTracker.swift
//  ApolloLocation
//
//  Created by Nikola Grujic on 10/02/2023.
//

import FoundationLogger
import CoreLocation

final class LocationTracker: NSObject, CLLocationManagerDelegate, LocationTrackerProtocol, LoggerInjected {
    private let locationManager = CLLocationManager()
    private var lastLocation: CLLocation?
    var updatingLocationStopped = true
    var distanceMeters: Double = 0.0
    var distanceKilometers: Double = 0.0

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

    func clear() {
        lastLocation = nil
        distanceMeters = 0.0
        distanceKilometers = 0.0
    }

    func update(_ location: CLLocation) {
        if lastLocation == nil {
            lastLocation = location
            return
        }

        distanceMeters += Double(lastLocation?.distance(from: location) ?? 0.0)
        distanceKilometers = distanceMeters / 1000.0
        lastLocation = location
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
            update(location)
        }
    }
}
