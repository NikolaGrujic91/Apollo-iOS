import XCTest
@testable import ApolloWeight

final class ApolloWeightTests: XCTestCase, WeightRepositoryInjected {
    func testWeightRepository() {
        var value = weightRepository.value
        XCTAssertEqual(value, 0)

        weightRepository.save(86)
        value = weightRepository.value
        XCTAssertEqual(value, 86)

        weightRepository.load()
        value = weightRepository.value
        XCTAssertEqual(value, 86)

        weightRepository.save(0)
        value = weightRepository.value
        XCTAssertEqual(value, 0)
    }
}
