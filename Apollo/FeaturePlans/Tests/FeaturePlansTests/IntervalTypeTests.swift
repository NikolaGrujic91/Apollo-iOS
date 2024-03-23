//
//  IntervalTypeTests.swift
//  
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeaturePlans
import XCTest

final class IntervalTypeTests: XCTestCase {
    func testIntervalColor() {
        var intervalType: IntervalType = .run
        XCTAssertEqual(intervalType.color(), .orange.opacity(0.4))

        intervalType = .walk
        XCTAssertEqual(intervalType.color(), .gray.opacity(0.4))

        intervalType = .fastRun
        XCTAssertEqual(intervalType.color(), .red.opacity(0.8))

        intervalType = .fastWalk
        XCTAssertEqual(intervalType.color(), .gray.opacity(0.8))
    }
}
