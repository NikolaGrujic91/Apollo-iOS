@testable import FoundationStorage
import XCTest

final class FoundationStorageTests: XCTestCase, StorageInjected {
    func testStorageUserDefaults() {
        storage.set("example", forKey: "testKeyString")
        var stringValue: String? = storage.get(forKey: "testKeyString")
        XCTAssertEqual(stringValue, "example")

        storage.set(10.0, forKey: "testKeyDouble")
        var doubleValue: Double = storage.get(forKey: "testKeyDouble")
        XCTAssertEqual(doubleValue, 10.0)

        storage.remove(forKey: "testKeyString")
        stringValue = storage.get(forKey: "testKeyString")
        XCTAssertNil(stringValue)

        storage.remove(forKey: "testKeyDouble")
        doubleValue = storage.get(forKey: "testKeyDouble")
        XCTAssertEqual(doubleValue, 0.0)
    }
}
