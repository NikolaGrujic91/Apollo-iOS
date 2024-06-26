//
//  MemoryLayoutTests.swift
//  
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeaturePlans
import XCTest

final class MemoryLayoutTests: XCTestCase {
    func testMemoryLayout() {
        XCTAssertEqual(class_getInstanceSize(Interval.self), 64)
        XCTAssertEqual(class_getInstanceSize(Plan.self), 48)
        XCTAssertEqual(class_getInstanceSize(Week.self), 72)
        XCTAssertEqual(class_getInstanceSize(Day.self), 120)
    }
}
