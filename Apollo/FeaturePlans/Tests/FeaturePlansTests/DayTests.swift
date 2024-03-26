//
//  DayTests.swift
//  
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeaturePlans
@testable import FoundationLocalization
import XCTest

final class DayTests: XCTestCase, PlansServiceInjected {
    // MARK: - Functions

    @MainActor
    override func setUp() {
        super.setUp()
        service.reset()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        service.reset()
        super.tearDown()
    }

    // MARK: - Tests

    @MainActor
    func testFractionsCalculation() async {
        XCTAssertEqual(service.plans.count, 6)

        let day = service.plans[0].weeks[0].days[0]
        XCTAssertEqual(day.totalTime(), 900)

        XCTAssertEqual(day.intervalType(0), .run)
        XCTAssertEqual(day.intervalType(1), .walk)

        XCTAssertFalse(day.fractionsCalculated)
        day.calculateFractions()
        XCTAssertTrue(day.fractionsCalculated)

        XCTAssertEqual(day.intervals[0].startFraction, 1.0)
        XCTAssertEqual(day.intervals[0].endFraction, 0.9333333333333333)
        XCTAssertEqual(day.intervals[1].startFraction, 0.9333333333333333)
        XCTAssertEqual(day.intervals[1].endFraction, 0.8333333333333334)
        XCTAssertEqual(day.intervals[2].startFraction, 0.8333333333333334)
        XCTAssertEqual(day.intervals[2].endFraction, 0.7666666666666667)
        XCTAssertEqual(day.intervals[3].startFraction, 0.7666666666666667)
        XCTAssertEqual(day.intervals[3].endFraction, 0.6666666666666667)
        XCTAssertEqual(day.intervals[4].startFraction, 0.6666666666666667)
        XCTAssertEqual(day.intervals[4].endFraction, 0.6000000000000001)
        XCTAssertEqual(day.intervals[5].startFraction, 0.6000000000000001)
        XCTAssertEqual(day.intervals[5].endFraction, 0.5000000000000001)
        XCTAssertEqual(day.intervals[6].startFraction, 0.5000000000000001)
        XCTAssertEqual(day.intervals[6].endFraction, 0.43333333333333346)
        XCTAssertEqual(day.intervals[7].startFraction, 0.43333333333333346)
        XCTAssertEqual(day.intervals[7].endFraction, 0.3333333333333335)
        XCTAssertEqual(day.intervals[8].startFraction, 0.3333333333333335)
        XCTAssertEqual(day.intervals[8].endFraction, 0.26666666666666683)
        XCTAssertEqual(day.intervals[9].startFraction, 0.26666666666666683)
        XCTAssertEqual(day.intervals[9].endFraction, 0.16666666666666682)
        XCTAssertEqual(day.intervals[10].startFraction, 0.16666666666666682)
        XCTAssertEqual(day.intervals[10].endFraction, 0.10000000000000016)
        XCTAssertEqual(day.intervals[11].startFraction, 0.10000000000000016)
        XCTAssertEqual(day.intervals[11].endFraction, 0.0)
    }

    @MainActor
    func testFullName() {
        XCTAssertEqual(service.plans[0].weeks[0].days[0].fullName(LanguageCode.english), "Day 1")
        XCTAssertEqual(service.plans[0].weeks[0].days[0].fullName(LanguageCode.german), "Tag 1")
        XCTAssertEqual(service.plans[0].weeks[0].days[0].fullName(LanguageCode.netherlands), "Dag 1")
        XCTAssertEqual(service.plans[0].weeks[0].days[0].fullName(LanguageCode.spanish), "Día 1")
        XCTAssertEqual(service.plans[0].weeks[0].days[0].fullName(LanguageCode.portuguese), "Dia 1")
        XCTAssertEqual(service.plans[0].weeks[0].days[0].fullName(LanguageCode.french), "Jour 1")
    }
}
