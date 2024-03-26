//
//  WeekTests.swift
//
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeaturePlans
@testable import FoundationLocalization
import XCTest

final class WeekTests: XCTestCase, PlansServiceInjected {
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
    func testFullName() {
        XCTAssertEqual(service.plans[0].weeks[0].fullName(LanguageCode.english), "Week 1")
        XCTAssertEqual(service.plans[0].weeks[0].fullName(LanguageCode.german), "Woche 1")
        XCTAssertEqual(service.plans[0].weeks[0].fullName(LanguageCode.netherlands), "Week 1")
        XCTAssertEqual(service.plans[0].weeks[0].fullName(LanguageCode.spanish), "Semana 1")
        XCTAssertEqual(service.plans[0].weeks[0].fullName(LanguageCode.portuguese), "Semana 1")
        XCTAssertEqual(service.plans[0].weeks[0].fullName(LanguageCode.french), "Semaine 1")
    }
}
