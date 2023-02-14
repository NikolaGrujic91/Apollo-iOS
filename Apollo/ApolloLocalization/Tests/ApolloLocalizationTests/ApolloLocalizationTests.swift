import XCTest
@testable import ApolloLocalization

final class ApolloLocalizationTests: XCTestCase {
    func testSettingsLanguage() {
        let localizationManager = LocalizationManager()

        // Default language
        XCTAssertEqual(localizationManager.language, .netherlands)

        localizationManager.save(Language.netherlands)
        XCTAssertEqual(localizationManager.language, Language.netherlands)

        localizationManager.load()
        XCTAssertEqual(localizationManager.language, Language.netherlands)

        XCTAssertEqual("plans".localized(localizationManager.language),          "Plannen")
        XCTAssertEqual("settings".localized(localizationManager.language),       "Instellingen")
        XCTAssertEqual("appearance".localized(localizationManager.language),     "Weergave")
        XCTAssertEqual("light".localized(localizationManager.language),          "Licht")
        XCTAssertEqual("dark".localized(localizationManager.language),           "Donker")
        XCTAssertEqual("language".localized(localizationManager.language),       "Taal")
        XCTAssertEqual("information".localized(localizationManager.language),    "Informatie")
        XCTAssertEqual("version".localized(localizationManager.language),        "Versie:")

        localizationManager.save(Language.english)
        XCTAssertEqual(localizationManager.language, Language.english)

        localizationManager.load()
        XCTAssertEqual(localizationManager.language, Language.english)

        XCTAssertEqual("plans".localized(localizationManager.language),          "Plans")
        XCTAssertEqual("settings".localized(localizationManager.language),       "Settings")
        XCTAssertEqual("appearance".localized(localizationManager.language),     "Appearance")
        XCTAssertEqual("light".localized(localizationManager.language),          "Light")
        XCTAssertEqual("dark".localized(localizationManager.language),           "Dark")
        XCTAssertEqual("language".localized(localizationManager.language),       "Language")
        XCTAssertEqual("information".localized(localizationManager.language),    "Information")
        XCTAssertEqual("version".localized(localizationManager.language),        "Version:")
    }
}
