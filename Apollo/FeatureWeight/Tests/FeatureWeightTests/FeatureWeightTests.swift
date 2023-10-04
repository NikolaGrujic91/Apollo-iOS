import XCTest
@testable import FeatureWeight

final class FeatureWeightTests: XCTestCase, WeightRepositoryInjected {
    func testWeightRepository() {
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

    func testWeightViewModel() {
        let weightViewModel = WeightViewModel()
        XCTAssertEqual(weightViewModel.bodyMass, "0.0")

        weightViewModel.bodyMass = "95.55555"
        weightViewModel.save()
        XCTAssertEqual(weightViewModel.bodyMass, "95.6")

        weightViewModel.bodyMass = "0.0"
        weightViewModel.save()
        XCTAssertEqual(weightViewModel.bodyMass, "0.0")
    }
}
