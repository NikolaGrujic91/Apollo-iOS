@testable import ApolloLocation
import CoreLocation
import XCTest

final class ApolloLocationTests: XCTestCase, LocationTrackerInjected {
    func testLocationTracker() throws {
        XCTAssertTrue(locationTracker.updatingLocationStopped)

        locationTracker.startUpdatingLocation()
        XCTAssertFalse(locationTracker.updatingLocationStopped)

        locationTracker.stopUpdatingLocation()
        XCTAssertTrue(locationTracker.updatingLocationStopped)
    }

    func testCalculateDistance() {
        XCTAssertEqual(locationTracker.calculateDistance(), 0.0)

        let locationAmsterdam = CLLocation(latitude: 52.39588142931445, longitude: 4.912621652144151)
        let locationTheHague = CLLocation(latitude: 52.07142246411551, longitude: 4.298537031487276)
        let locationRotterdam = CLLocation(latitude: 51.95016484104055, longitude: 4.468341637214316)

        locationTracker.addLocation(locationAmsterdam)
        locationTracker.addLocation(locationTheHague)
        locationTracker.addLocation(locationRotterdam)

        XCTAssertEqual(locationTracker.calculateDistance(), 73181.371632141498)
    }
}
