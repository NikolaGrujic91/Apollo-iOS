import XCTest
@testable import ApolloWeight

final class ApolloWeightTests: XCTestCase, WeightRepositoryInjected {
    func testWeightRepository() {
        var value = repository.value
        XCTAssertEqual(value, 0)

        repository.save(86)
        value = repository.value
        XCTAssertEqual(value, 86)

        repository.load()
        value = repository.value
        XCTAssertEqual(value, 86)

        repository.save(0)
        value = repository.value
        XCTAssertEqual(value, 0)
    }
}
