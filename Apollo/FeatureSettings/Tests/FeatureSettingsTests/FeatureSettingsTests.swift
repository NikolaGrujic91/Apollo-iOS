import XCTest
import FoundationLocalization
@testable import FeatureSettings

final class FeatureSettingsTests: XCTestCase {
    func testSettingsLanguage() {
        let localizationManager = LocalizationManager()

        // Default language
        XCTAssertEqual(localizationManager.language, .netherlands)

        localizationManager.save(Language.netherlands)
        XCTAssertEqual(localizationManager.language, Language.netherlands)

        localizationManager.load()
        XCTAssertEqual(localizationManager.language, Language.netherlands)

        XCTAssertEqual("plans".localized(localizationManager.language), "Plannen")
        XCTAssertEqual("settings".localized(localizationManager.language), "Instellingen")
        XCTAssertEqual("appearance".localized(localizationManager.language), "Weergave")
        XCTAssertEqual("light".localized(localizationManager.language), "Licht")
        XCTAssertEqual("dark".localized(localizationManager.language), "Donker")
        XCTAssertEqual("language".localized(localizationManager.language), "Taal")
        XCTAssertEqual("weight".localized(localizationManager.language), "Gewicht")
        XCTAssertEqual("data".localized(localizationManager.language), "Gegevens")
        XCTAssertEqual("resetLabel".localized(localizationManager.language), "Reset calorieën en afstanden")
        XCTAssertEqual("resetQuestion".localized(localizationManager.language), "Weet je zeker dat je calorieën en afstanden wilt resetten?")
        XCTAssertEqual("reset".localized(localizationManager.language), "Resetten")
        XCTAssertEqual("cancel".localized(localizationManager.language), "Annuleren")
        XCTAssertEqual("start".localized(localizationManager.language), "Starten")
        XCTAssertEqual("pause".localized(localizationManager.language), "Pauze")
        XCTAssertEqual("resume".localized(localizationManager.language), "Doorgaan")
        XCTAssertEqual("save".localized(localizationManager.language), "Opslaan")
        XCTAssertEqual("loadHealth".localized(localizationManager.language), "Laden vanaf Health")
        XCTAssertEqual("information".localized(localizationManager.language), "Informatie")
        XCTAssertEqual("version".localized(localizationManager.language), "Versie:")

        localizationManager.save(Language.english)
        XCTAssertEqual(localizationManager.language, Language.english)

        localizationManager.load()
        XCTAssertEqual(localizationManager.language, Language.english)

        XCTAssertEqual("plans".localized(localizationManager.language), "Plans")
        XCTAssertEqual("settings".localized(localizationManager.language), "Settings")
        XCTAssertEqual("appearance".localized(localizationManager.language), "Appearance")
        XCTAssertEqual("light".localized(localizationManager.language), "Light")
        XCTAssertEqual("dark".localized(localizationManager.language), "Dark")
        XCTAssertEqual("language".localized(localizationManager.language), "Language")
        XCTAssertEqual("weight".localized(localizationManager.language), "Weight")
        XCTAssertEqual("data".localized(localizationManager.language), "Data")
        XCTAssertEqual("resetLabel".localized(localizationManager.language), "Reset calories and distances")
        XCTAssertEqual("resetQuestion".localized(localizationManager.language), "Are you sure you want to reset calories and distances?")
        XCTAssertEqual("reset".localized(localizationManager.language), "Reset")
        XCTAssertEqual("cancel".localized(localizationManager.language), "Cancel")
        XCTAssertEqual("start".localized(localizationManager.language), "Start")
        XCTAssertEqual("pause".localized(localizationManager.language), "Pause")
        XCTAssertEqual("resume".localized(localizationManager.language), "Resume")
        XCTAssertEqual("save".localized(localizationManager.language), "Save")
        XCTAssertEqual("loadHealth".localized(localizationManager.language), "Load from Health")
        XCTAssertEqual("information".localized(localizationManager.language), "Information")
        XCTAssertEqual("version".localized(localizationManager.language), "Version:")
    }
}
