//
//  ActivityStatsTests.swift
//  
//
//  Created by Nikola Grujic on 26/03/2024.
//

@testable import FeaturePlans
import XCTest

final class ActivityStatsTests: XCTestCase {
    func testActivityStats() {
        let sut = ActivityStats()

        sut.setDistanceKilometersFormatted(8.0)
        XCTAssertEqual(sut.distanceKilometers, "8.00")

        sut.setCalories(8.0, 85.0)
        XCTAssertEqual(sut.calories, 704)

        sut.setPace(2700, 8.0)
        XCTAssertEqual(sut.pace, 337.5)
        XCTAssertEqual(sut.paceFormatted, "05:37")
    }
}
