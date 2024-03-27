//
//  ActivityViewModelTests.swift
//  
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeaturePlans
import XCTest

final class ActivityViewModelTests: XCTestCase {
    // MARK: - Properties

    private var activityViewModel: ActivityViewModel?

    @MainActor
    override func setUp() {
        super.setUp()
        activityViewModel = ActivityViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        activityViewModel = nil
        super.tearDown()
    }

    // MARK: - Tests

    @MainActor
    func testActiveButtonStates() async {
        XCTAssertNotNil(activityViewModel)

        XCTAssertEqual(activityViewModel?.progress.intervalTimeRemaining, 0)
        XCTAssertEqual(activityViewModel?.activeButton, .start)

        activityViewModel?.onAppear(day: Day(), bodyMass: 0.0)
        XCTAssertEqual(activityViewModel?.activeButton, .start)

        activityViewModel?.startPressed()
        XCTAssertEqual(activityViewModel?.activeButton, .pause)

        activityViewModel?.pausePressed()
        XCTAssertEqual(activityViewModel?.activeButton, .resume)

        activityViewModel?.resumePressed()
        XCTAssertEqual(activityViewModel?.activeButton, .pause)
    }
}
