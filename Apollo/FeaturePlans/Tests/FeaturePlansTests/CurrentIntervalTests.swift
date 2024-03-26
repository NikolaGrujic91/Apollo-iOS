//
//  CurrentIntervalTests.swift
//  
//
//  Created by Nikola Grujic on 26/03/2024.
//

@testable import FeaturePlans
import XCTest

final class CurrentIntervalTests: XCTestCase {
    func testCurrentInterval() {
        let sut = CurrentInterval(0, 5)

        XCTAssertEqual(sut.get(), 0)
        XCTAssertEqual(sut.getDisplay(), 1)
        XCTAssertEqual(sut.getTotal(), 5)

        sut.next()
        XCTAssertEqual(sut.get(), 1)
        XCTAssertEqual(sut.getDisplay(), 2)

        sut.next()
        sut.next()
        sut.next()
        XCTAssertEqual(sut.get(), 4)
        XCTAssertEqual(sut.getDisplay(), 5)

        sut.next()
        XCTAssertEqual(sut.get(), 5)
        XCTAssertEqual(sut.getDisplay(), 6)

        sut.next()
        XCTAssertEqual(sut.get(), 5)
        XCTAssertEqual(sut.getDisplay(), 6)

        sut.reset()
        XCTAssertEqual(sut.get(), 0)
        XCTAssertEqual(sut.getDisplay(), 1)
        XCTAssertEqual(sut.getTotal(), 5)
    }
}
