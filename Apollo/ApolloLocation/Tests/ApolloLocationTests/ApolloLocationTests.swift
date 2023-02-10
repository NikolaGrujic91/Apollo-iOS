import XCTest
@testable import ApolloLocation

final class ApolloLocationTests: XCTestCase, LocationTrackerInjected {
    func testLocationTracker() throws {
        XCTAssertTrue(locationTracker.updatingLocationStopped)

        locationTracker.startUpdatingLocation()
        XCTAssertFalse(locationTracker.updatingLocationStopped)

        locationTracker.stopUpdatingLocation()
        XCTAssertTrue(locationTracker.updatingLocationStopped)
    }
}
