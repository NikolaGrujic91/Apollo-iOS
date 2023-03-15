@testable import FoundationLocation
import CoreLocation
import XCTest

final class FoundationLocationTests: XCTestCase, LocationTrackerInjected {
    func testLocationTracker() throws {
        XCTAssertTrue(locationTracker.updatingLocationStopped)

        locationTracker.startUpdatingLocation()
        XCTAssertFalse(locationTracker.updatingLocationStopped)

        locationTracker.stopUpdatingLocation()
        XCTAssertTrue(locationTracker.updatingLocationStopped)
    }

    func testCalculateDistance() {
        XCTAssertEqual(locationTracker.distanceMeters, 0.0)
        XCTAssertEqual(locationTracker.distanceKilometers, 0.0)

        let locationAmsterdam = CLLocation(latitude: 52.39588142931445, longitude: 4.912621652144151)
        let locationTheHague = CLLocation(latitude: 52.07142246411551, longitude: 4.298537031487276)
        let locationRotterdam = CLLocation(latitude: 51.95016484104055, longitude: 4.468341637214316)

        locationTracker.update(locationAmsterdam)
        XCTAssertEqual(locationTracker.distanceMeters, 0.0)
        XCTAssertEqual(locationTracker.distanceKilometers, 0.0)

        locationTracker.update(locationTheHague)
        XCTAssertEqual(locationTracker.distanceMeters, 55349.70563594286)
        XCTAssertEqual(locationTracker.distanceKilometers, 55.34970563594286)

        locationTracker.update(locationRotterdam)
        XCTAssertEqual(locationTracker.distanceMeters, 73181.371632141498)
        XCTAssertEqual(locationTracker.distanceKilometers, 73.18137163214149)

        locationTracker.clear()
        XCTAssertEqual(locationTracker.distanceMeters, 0.0)
        XCTAssertEqual(locationTracker.distanceKilometers, 0.0)
    }
}
