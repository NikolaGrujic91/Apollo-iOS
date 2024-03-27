//
//  ActivityProgressTests.swift
//  
//
//  Created by Nikola Grujic on 27/03/2024.
//

@testable import FeaturePlans
import XCTest

final class ActivityProgressTests: XCTestCase {
    // MARK: - Properties

    private var sut: ActivityProgress?
    private let intervalTime = 60

    // MARK: - Functions

    @MainActor
    override func setUp() {
        super.setUp()
        sut = ActivityProgress()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    @MainActor
    func update() {
        var numberOfUpdates = 0
        while numberOfUpdates < (intervalTime / 2) {
            sut?.update()
            numberOfUpdates += 1
        }
    }


    // MARK: - Tests

    @MainActor
    func testActivityProgress() {
        XCTAssertEqual(sut?.intervalTimeRemaining, 0)
        XCTAssertEqual(sut?.totalTimeElapsed, 0)
        XCTAssertEqual(sut?.progressInterval(), 0.0)
        XCTAssertEqual(sut?.progressTotal(), 0.0)

        sut?.set(intervalTime, 300)
        XCTAssertEqual(sut?.intervalTimeRemaining, 60)
        XCTAssertEqual(sut?.totalTimeElapsed, 0)
        XCTAssertEqual(sut?.progressInterval(), 1.0)
        XCTAssertEqual(sut?.progressTotal(), 1.0)

        update()

        XCTAssertEqual(sut?.intervalTimeRemaining, 30)
        XCTAssertEqual(sut?.totalTimeElapsed, 30)
        XCTAssertEqual(sut?.progressInterval(), 0.5)
        XCTAssertEqual(sut?.progressTotal(), 0.9)

        update()

        XCTAssertEqual(sut?.intervalTimeRemaining, 0)
        XCTAssertEqual(sut?.totalTimeElapsed, 60)
        XCTAssertEqual(sut?.progressInterval(), 0.0)
        XCTAssertEqual(sut?.progressTotal(), 0.8)

        sut?.setIntervalTime(intervalTime)
        update()
        update()
        sut?.setIntervalTime(intervalTime)
        update()
        update()
        sut?.setIntervalTime(intervalTime)
        update()

        XCTAssertEqual(sut?.intervalTimeRemaining, 30)
        XCTAssertEqual(sut?.totalTimeElapsed, 210)
        XCTAssertEqual(sut?.progressInterval(), 0.5)
        XCTAssertEqual(sut?.progressTotal(), 0.3)

        update()
        sut?.setIntervalTime(intervalTime)
        update()
        update()

        // Finished
        XCTAssertEqual(sut?.intervalTimeRemaining, 0)
        XCTAssertEqual(sut?.totalTimeElapsed, 300)
        XCTAssertEqual(sut?.progressInterval(), 0.0)
        XCTAssertEqual(sut?.progressTotal(), 0.0)

        // Check it can not go beyond finished state
        sut?.setIntervalTime(intervalTime)
        update()
        update()

        XCTAssertEqual(sut?.intervalTimeRemaining, 60)
        XCTAssertEqual(sut?.totalTimeElapsed, 300)
        XCTAssertEqual(sut?.progressInterval(), 0.0)
        XCTAssertEqual(sut?.progressTotal(), 0.0)
    }
}
