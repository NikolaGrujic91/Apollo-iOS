@testable import ApolloWeight
import XCTest

final class ApolloWeightTests: XCTestCase, WeightRepositoryInjected {
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
}
