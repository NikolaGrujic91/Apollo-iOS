//
//  WeightViewModelTests.swift
//  
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeatureWeight
import XCTest

final class WeightViewModelTests: XCTestCase {
    // MARK: - Properties

    private var weightViewModel: WeightViewModel?

    // MARK: Functions

    @MainActor
    override func setUp() {
        super.setUp()
        weightViewModel = WeightViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        weightViewModel = nil
        super.tearDown()
    }

    // MARK: - Tests

    @MainActor
    func testViewModelOperations() {
        XCTAssertNotNil(weightViewModel)
        XCTAssertEqual(weightViewModel?.bodyMass, "0.0")

        weightViewModel?.bodyMass = "95.55555"
        weightViewModel?.save()
        XCTAssertEqual(weightViewModel?.bodyMass, "95.6")

        weightViewModel?.bodyMass = "0.0"
        weightViewModel?.save()
        XCTAssertEqual(weightViewModel?.bodyMass, "0.0")
    }
}
