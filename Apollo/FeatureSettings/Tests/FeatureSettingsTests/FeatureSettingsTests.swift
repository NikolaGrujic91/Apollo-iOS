import XCTest
import SwiftUI
import FoundationLocalization
@testable import FeatureSettings

final class FeatureSettingsTests: XCTestCase, WeightRepositoryInjected {
    func testLocalizationViewModel() {
        let localizationManager = LocalizationViewModel()

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

    func testTheme() {
        let theme = ThemeViewModel()

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

    func testWeightRepository() {
        var bodyMass = weightRepository.bodyMass
        XCTAssertEqual(bodyMass, 0)

        weightRepository.save(86)
        bodyMass = weightRepository.bodyMass
        XCTAssertEqual(bodyMass, 86)

        weightRepository.load()
        bodyMass = weightRepository.bodyMass
        XCTAssertEqual(bodyMass, 86)

        weightRepository.save(0)
        bodyMass = weightRepository.bodyMass
        XCTAssertEqual(bodyMass, 0)
    }

    func testWeightViewModel() {
        let weightViewModel = WeightViewModel()
        XCTAssertEqual(weightViewModel.bodyMass, "0.0")

        weightViewModel.bodyMass = "95.55555"
        weightViewModel.save()
        weightViewModel.update()
        XCTAssertEqual(weightViewModel.bodyMass, "95.6")

        weightViewModel.bodyMass = "0.0"
        weightViewModel.save()
        weightViewModel.update()
        XCTAssertEqual(weightViewModel.bodyMass, "0.0")
    }
}
