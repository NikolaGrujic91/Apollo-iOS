@testable import FeatureSettings
import FoundationLocalization
import SwiftUI
import XCTest

final class FeatureSettingsTests: XCTestCase, WeightRepositoryInjected {
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
