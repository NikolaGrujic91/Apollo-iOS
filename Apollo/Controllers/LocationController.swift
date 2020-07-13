//
//  LocationController.swift
//  Apollo
//
//  Created by Nikola Grujic on 12/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import Foundation
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate
{
    private let locationManager = CLLocationManager();
    private var locations = [CLLocation]();
    private var updatingLocationStopped = true;
    
    override init()
    {
        super.init();
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    // MARK: - Helper methods
    
    internal func requestAuthorization() -> Void
    {
        if CLLocationManager.authorizationStatus() == .notDetermined
        {
            self.locationManager.requestWhenInUseAuthorization();
        }
    }
    
    internal func startUpdatingLocation()
    {
        self.locationManager.startUpdatingLocation();
        self.updatingLocationStopped = false;
    }
    
    internal func stopUpdatingLocation()
    {
        self.locationManager.stopUpdatingLocation();
        self.updatingLocationStopped = true;
    }
    
    internal func isUpdatingLocationStopped() -> Bool
    {
        return self.updatingLocationStopped;
    }
    
    internal func calculateDistance() -> Double
    {
        var distance = 0.0;
        
        for i in 0..<self.locations.count - 1
        {
            let currentLocation = self.locations[i];
            let nextLocation = self.locations[i + 1];
            
            distance += nextLocation.distance(from: currentLocation);
        }
        
        return distance;
    }
    
    // MARK: - CLLocationManagerDelegate methods
    
    // Tells the delegate its authorization status when the app creates the location manager and when the authorization status changes.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        switch status
        {
            case .restricted: print("Location restricted");
            case .denied: print("Location denied");
            case .notDetermined: print("Location notDetermined");
            case .authorizedAlways: print("Location authorizedAlways");
            case .authorizedWhenInUse: print("Location authorizedWhenInUse");
            default: print("Other");
        }
    }
    
    // Tells the delegate that the location manager was unable to retrieve a location value.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        manager.stopUpdatingLocation();
        print(error);
    }
    
    // Tells the delegate that new location data is available.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.last
        {
            print("Location updated: \(location.coordinate)");
            self.locations.append(location);
        }
    }
}
