@testable import FoundationTheme
import XCTest

final class ThemeViewModelTests: XCTestCase {
    func testThemeViewModel() {
        let viewModel = ThemeViewModel()

        XCTAssertNil(viewModel.colorScheme)

        viewModel.load()
        XCTAssertEqual(viewModel.colorScheme, .light)

        viewModel.save(.dark)
        XCTAssertEqual(viewModel.colorScheme, .dark)

        viewModel.save(.light)
        XCTAssertEqual(viewModel.colorScheme, .light)
    }
}
