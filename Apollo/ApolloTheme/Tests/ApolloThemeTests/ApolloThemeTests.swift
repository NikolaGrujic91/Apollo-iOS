import XCTest
import SwiftUI
@testable import ApolloTheme

final class ApolloThemeTests: XCTestCase {
    func testTheme() {
        let theme = ThemeManager()

        // Default settings
        XCTAssertEqual(theme.colorScheme, nil)

        // Set and read dark
        theme.save(ColorScheme.dark)
        XCTAssertEqual(theme.colorScheme, ColorScheme.dark)

        theme.load()
        XCTAssertEqual(theme.colorScheme, ColorScheme.dark)

        // Set and read light
        theme.save(ColorScheme.light)
        XCTAssertEqual(theme.colorScheme, ColorScheme.light)

        theme.load()
        XCTAssertEqual(theme.colorScheme, ColorScheme.light)
    }
}
