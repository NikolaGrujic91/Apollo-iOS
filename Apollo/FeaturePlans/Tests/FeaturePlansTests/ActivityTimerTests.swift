//
//  ActivityTimerTests.swift
//  
//
//  Created by Nikola Grujic on 05/04/2024.
//

@testable import FeaturePlans
import XCTest

final class ActivityTimerTests: XCTestCase {
    // MARK: - Properties

    private var sut: ActivityTimer?
    private var numberOfTicks = 0

    // MARK: - Functions

    @MainActor
    override func setUp() {
        super.setUp()
        sut = ActivityTimer(onTick: self.onTick)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    @MainActor
    func onTick() {
        numberOfTicks += 1
    }


    // MARK: - Tests

    @MainActor
    func testActivityTimer() {
        XCTAssertEqual(sut?.state, .stopped)

        sut?.start()
        XCTAssertEqual(sut?.state, .started)

        sut?.stop()
        XCTAssertEqual(sut?.state, .stopped)
    }
}
