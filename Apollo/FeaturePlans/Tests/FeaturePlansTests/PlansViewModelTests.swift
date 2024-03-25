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

    // MARK: Functions

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

        var planImage = plansViewModel?.getImage(.basic0to2K)
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage(.basic0to5K)
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage(.basic5Kto10K)
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage(.weightLossLevel1)
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage(.weightLossLevel2)
        XCTAssertNotNil(planImage)

        planImage = plansViewModel?.getImage(.weightLossLevel3)
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
            XCTAssertEqual(plan.name, .basic0to2K)
        } else {
            XCTFail("Plan UUID or plan not found!")
        }
    }
}
