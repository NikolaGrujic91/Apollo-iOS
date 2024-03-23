//
//  PlansViewModelTests.swift
//
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeaturePlans
import XCTest

final class PlansViewModelTests: XCTestCase {
    // MARK: - Properties

    private var plansViewModel: PlansViewModel?

    @MainActor
    override func setUp() {
        super.setUp()
        plansViewModel = PlansViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        plansViewModel = nil
        super.tearDown()
    }

    // MARK: - Tests

    @MainActor
    func testLoadPlansInViewModel() async {
        XCTAssertNotNil(plansViewModel)
        XCTAssertEqual(plansViewModel?.plans.count, 0)

        await plansViewModel?.load()
        XCTAssertEqual(plansViewModel?.plans.count, 0)

        plansViewModel?.update()
        XCTAssertEqual(plansViewModel?.plans.count, 6)
    }

    @MainActor
    func testGetImagePerPlan() {
        XCTAssertNotNil(plansViewModel)

        var planImage = plansViewModel?.getImage("0 to 2K")
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage("0 to 5K")
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage("5K to 10K")
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage("Weight Loss: Level 1")
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage("Weight Loss: Level 2")
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage("")
        XCTAssertNotNil(planImage)
    }

    @MainActor
    func testGetGif() {
        XCTAssertNotNil(plansViewModel)
        let gif = plansViewModel?.getGif(.success)
        XCTAssertNotNil(gif)
    }

    @MainActor
    func testGetPlanByUUID() async {
        XCTAssertNotNil(plansViewModel)
        XCTAssertEqual(plansViewModel?.plans.count, 0)

        await plansViewModel?.load()
        XCTAssertEqual(plansViewModel?.plans.count, 0)

        plansViewModel?.update()
        XCTAssertEqual(plansViewModel?.plans.count, 6)

        if let uuid = plansViewModel?.plans[0].id,
            let plan = plansViewModel?.get(uuid) {
            XCTAssertEqual(plan.name, "0 to 2K")
        } else {
            XCTFail("Plan UUID or plan not found!")
        }
    }
}
