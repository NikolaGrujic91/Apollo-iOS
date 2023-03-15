import SwiftUI
@testable import UtilityExtensions
import XCTest

final class UtilityExtensionsTests: XCTestCase {
    func testColorSchemeExtension() {
        var colorScheme = ColorScheme.dark
        XCTAssertEqual(colorScheme.toString(), "dark")

        colorScheme = .light
        XCTAssertEqual(colorScheme.toString(), "light")

        colorScheme = ColorScheme.fromString("dark")
        XCTAssertEqual(colorScheme, .dark)

        colorScheme = ColorScheme.fromString("light")
        XCTAssertEqual(colorScheme, .light)
    }

    func testTimeIntervalExtension() {
        var timeInterval = TimeInterval(integerLiteral: 90)
        XCTAssertEqual(timeInterval.format(), "01:30")

        timeInterval = TimeInterval(integerLiteral: 3900)
        XCTAssertEqual(timeInterval.format(), "01:05:00")
    }

    func testUIUserInterfaceStyleExtension() {
        var userInterfaceStyle = UIUserInterfaceStyle.dark
        XCTAssertEqual(userInterfaceStyle.toColorScheme(), ColorScheme.dark)

        userInterfaceStyle = UIUserInterfaceStyle.light
        XCTAssertEqual(userInterfaceStyle.toColorScheme(), ColorScheme.light)
    }
}
