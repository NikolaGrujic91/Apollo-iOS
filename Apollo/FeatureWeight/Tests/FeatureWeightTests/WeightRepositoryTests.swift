//
//  WeightRepositoryTests.swift
//
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeatureWeight
import XCTest

final class WeightRepositoryTests: XCTestCase, WeightRepositoryInjected {
    @MainActor
    func testRepositoryOperations() {
        var bodyMass = repository.bodyMass
        XCTAssertEqual(bodyMass, 0)

        repository.save(86)
        bodyMass = repository.bodyMass
        XCTAssertEqual(bodyMass, 86)

        repository.load()
        bodyMass = repository.bodyMass
        XCTAssertEqual(bodyMass, 86)

        repository.save(0)
        bodyMass = repository.bodyMass
        XCTAssertEqual(bodyMass, 0)
    }
}
