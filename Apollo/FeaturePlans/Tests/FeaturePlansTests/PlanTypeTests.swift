//
//  PlanTypeTests.swift
//  
//
//  Created by Nikola Grujic on 25/03/2024.
//

@testable import FeaturePlans
@testable import FoundationLocalization
import XCTest

final class PlanTypeTests: XCTestCase {
    @MainActor
    func testBasic0to2KTranslations() {
        XCTAssertEqual(PlanType.basic0to2K.rawValue.localized(.english), "0 to 2K")
        XCTAssertEqual(PlanType.basic0to2K.rawValue.localized(.german), "0 bis 2K")
        XCTAssertEqual(PlanType.basic0to2K.rawValue.localized(.netherlands), "0 tot 2K")
        XCTAssertEqual(PlanType.basic0to2K.rawValue.localized(.spanish), "0 a 2K")
        XCTAssertEqual(PlanType.basic0to2K.rawValue.localized(.portuguese), "0 a 2K")
        XCTAssertEqual(PlanType.basic0to2K.rawValue.localized(.french), "0 à 2K")
    }

    @MainActor
    func testBasic0to5KTranslations() {
        XCTAssertEqual(PlanType.basic0to5K.rawValue.localized(.english), "0 to 5K")
        XCTAssertEqual(PlanType.basic0to5K.rawValue.localized(.german), "0 bis 5K")
        XCTAssertEqual(PlanType.basic0to5K.rawValue.localized(.netherlands), "0 tot 5K")
        XCTAssertEqual(PlanType.basic0to5K.rawValue.localized(.spanish), "0 a 5K")
        XCTAssertEqual(PlanType.basic0to5K.rawValue.localized(.portuguese), "0 a 5K")
        XCTAssertEqual(PlanType.basic0to5K.rawValue.localized(.french), "0 à 5K")
    }

    @MainActor
    func testBasic5Kto10KTranslations() {
        XCTAssertEqual(PlanType.basic5Kto10K.rawValue.localized(.english), "5K to 10K")
        XCTAssertEqual(PlanType.basic5Kto10K.rawValue.localized(.german), "5K bis 10K")
        XCTAssertEqual(PlanType.basic5Kto10K.rawValue.localized(.netherlands), "5K tot 10K")
        XCTAssertEqual(PlanType.basic5Kto10K.rawValue.localized(.spanish), "5K a 10K")
        XCTAssertEqual(PlanType.basic5Kto10K.rawValue.localized(.portuguese), "5K a 10K")
        XCTAssertEqual(PlanType.basic5Kto10K.rawValue.localized(.french), "5K à 10K")
    }

    @MainActor
    func testWeightLossLevel1Translations() {
        XCTAssertEqual(PlanType.weightLossLevel1.rawValue.localized(.english), "Weight Loss: Level 1")
        XCTAssertEqual(PlanType.weightLossLevel1.rawValue.localized(.german), "Gewichtsverlust: Stufe 1")
        XCTAssertEqual(PlanType.weightLossLevel1.rawValue.localized(.netherlands), "Gewichtsverlies: Niveau 1")
        XCTAssertEqual(PlanType.weightLossLevel1.rawValue.localized(.spanish), "Pérdida de peso: nivel 1")
        XCTAssertEqual(PlanType.weightLossLevel1.rawValue.localized(.portuguese), "Perda de peso: Nível 1")
        XCTAssertEqual(PlanType.weightLossLevel1.rawValue.localized(.french), "Perte de poids : niveau 1")
    }

    @MainActor
    func testWeightLossLevel2Translations() {
        XCTAssertEqual(PlanType.weightLossLevel2.rawValue.localized(.english), "Weight Loss: Level 2")
        XCTAssertEqual(PlanType.weightLossLevel2.rawValue.localized(.german), "Gewichtsverlust: Stufe 2")
        XCTAssertEqual(PlanType.weightLossLevel2.rawValue.localized(.netherlands), "Gewichtsverlies: Niveau 2")
        XCTAssertEqual(PlanType.weightLossLevel2.rawValue.localized(.spanish), "Pérdida de peso: nivel 2")
        XCTAssertEqual(PlanType.weightLossLevel2.rawValue.localized(.portuguese), "Perda de peso: Nível 2")
        XCTAssertEqual(PlanType.weightLossLevel2.rawValue.localized(.french), "Perte de poids : niveau 2")
    }

    @MainActor
    func testWeightLossLevel3Translations() {
        XCTAssertEqual(PlanType.weightLossLevel3.rawValue.localized(.english), "Weight Loss: Level 3")
        XCTAssertEqual(PlanType.weightLossLevel3.rawValue.localized(.german), "Gewichtsverlust: Stufe 3")
        XCTAssertEqual(PlanType.weightLossLevel3.rawValue.localized(.netherlands), "Gewichtsverlies: Niveau 3")
        XCTAssertEqual(PlanType.weightLossLevel3.rawValue.localized(.spanish), "Pérdida de peso: nivel 3")
        XCTAssertEqual(PlanType.weightLossLevel3.rawValue.localized(.portuguese), "Perda de peso: Nível 3")
        XCTAssertEqual(PlanType.weightLossLevel3.rawValue.localized(.french), "Perte de poids : niveau 3")
    }
}
