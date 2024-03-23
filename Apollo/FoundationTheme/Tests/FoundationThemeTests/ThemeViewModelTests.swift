//
//  ThemeViewModelTests.swift
//
//
//  Created by Nikola Grujic on 23/03/2024.
//


@testable import FoundationTheme
import XCTest

final class ThemeViewModelTests: XCTestCase {
    // MARK: - Properties

    private var themeViewModel: ThemeViewModel?

    // MARK: Functions

    @MainActor
    override func setUp() {
        super.setUp()
        themeViewModel = ThemeViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        themeViewModel = nil
        super.tearDown()
    }

    // MARK: - Tests

    @MainActor
    func testOperations() {
        XCTAssertNotNil(themeViewModel)

        XCTAssertNil(themeViewModel?.colorScheme)

        themeViewModel?.load()
        XCTAssertEqual(themeViewModel?.colorScheme, .light)

        themeViewModel?.save(.dark)
        XCTAssertEqual(themeViewModel?.colorScheme, .dark)

        themeViewModel?.save(.light)
        XCTAssertEqual(themeViewModel?.colorScheme, .light)
    }
}
