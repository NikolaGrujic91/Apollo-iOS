@testable import FeaturePlans
import XCTest

final class PlansRepositoryTests: XCTestCase, PlansRepositoryInjected {
    // MARK: - Properties
    private let calories = 600
    private let distance = 6000

    // MARK: - Functions

    @MainActor
    override func setUp() {
        super.setUp()
        plansRepository.reset()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        plansRepository.reset()
        super.tearDown()
    }

    @MainActor
    func verifyDayWithValue() {
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].calories, calories)
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].distance, distance)
    }

    @MainActor
    func verifyDayInitialValue() {
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].calories, 0)
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].distance, 0)
    }

    @MainActor
    func verifyPlans() {
        let plan1 = plansRepository.plans[0]
        XCTAssertEqual(plan1.name, .basic0to2K)
        XCTAssertEqual(plan1.weeks.count, 6)
        XCTAssertEqual(plan1.weeks[0].days.count, 3)
        XCTAssertEqual(plan1.weeks[1].days.count, 3)
        XCTAssertEqual(plan1.weeks[2].days.count, 3)
        XCTAssertEqual(plan1.weeks[3].days.count, 3)
        XCTAssertEqual(plan1.weeks[4].days.count, 3)
        XCTAssertEqual(plan1.weeks[5].days.count, 1)

        let plan2 = plansRepository.plans[1]
        XCTAssertEqual(plan2.name, .basic0to5K)
        XCTAssertEqual(plan2.weeks.count, 8)
        XCTAssertEqual(plan2.weeks[0].days.count, 3)
        XCTAssertEqual(plan2.weeks[1].days.count, 3)
        XCTAssertEqual(plan2.weeks[2].days.count, 3)
        XCTAssertEqual(plan2.weeks[3].days.count, 3)
        XCTAssertEqual(plan2.weeks[4].days.count, 3)
        XCTAssertEqual(plan2.weeks[5].days.count, 3)
        XCTAssertEqual(plan2.weeks[6].days.count, 3)
        XCTAssertEqual(plan2.weeks[7].days.count, 3)

        let plan3 = plansRepository.plans[2]
        XCTAssertEqual(plan3.name, .basic5Kto10K)
        XCTAssertEqual(plan3.weeks.count, 6)
        XCTAssertEqual(plan3.weeks[0].days.count, 3)
        XCTAssertEqual(plan3.weeks[1].days.count, 3)
        XCTAssertEqual(plan3.weeks[2].days.count, 3)
        XCTAssertEqual(plan3.weeks[3].days.count, 3)
        XCTAssertEqual(plan3.weeks[4].days.count, 3)
        XCTAssertEqual(plan3.weeks[5].days.count, 3)

        let plan4 = plansRepository.plans[3]
        XCTAssertEqual(plan4.name, .weightLossLevel1)
        XCTAssertEqual(plan4.weeks.count, 6)
        XCTAssertEqual(plan4.weeks[0].days.count, 3)
        XCTAssertEqual(plan4.weeks[1].days.count, 3)
        XCTAssertEqual(plan4.weeks[2].days.count, 3)
        XCTAssertEqual(plan4.weeks[3].days.count, 3)
        XCTAssertEqual(plan4.weeks[4].days.count, 3)
        XCTAssertEqual(plan4.weeks[5].days.count, 3)

        let plan5 = plansRepository.plans[4]
        XCTAssertEqual(plan5.name, .weightLossLevel2)
        XCTAssertEqual(plan5.weeks.count, 6)
        XCTAssertEqual(plan5.weeks[0].days.count, 3)
        XCTAssertEqual(plan5.weeks[1].days.count, 3)
        XCTAssertEqual(plan5.weeks[2].days.count, 3)
        XCTAssertEqual(plan5.weeks[3].days.count, 3)
        XCTAssertEqual(plan5.weeks[4].days.count, 3)
        XCTAssertEqual(plan5.weeks[5].days.count, 3)

        let plan6 = plansRepository.plans[5]
        XCTAssertEqual(plan6.name, .weightLossLevel3)
        XCTAssertEqual(plan6.weeks.count, 6)
        XCTAssertEqual(plan6.weeks[0].days.count, 3)
        XCTAssertEqual(plan6.weeks[1].days.count, 3)
        XCTAssertEqual(plan6.weeks[2].days.count, 3)
        XCTAssertEqual(plan6.weeks[3].days.count, 3)
        XCTAssertEqual(plan6.weeks[4].days.count, 3)
        XCTAssertEqual(plan6.weeks[5].days.count, 3)
    }

    // MARK: - Tests

    @MainActor
    func testRepositoryOperations() async {
        // Check default plans
        XCTAssertEqual(plansRepository.plans.count, 6)
        verifyPlans()
        verifyDayInitialValue()

        // Modify days and calories and save them
        plansRepository.plans[0].weeks[0].days[0].calories = calories
        plansRepository.plans[0].weeks[0].days[0].distance = distance
        verifyDayWithValue()

        plansRepository.save()
        verifyPlans()
        verifyDayWithValue()

        // Remove UserDefaults modified plans and restore default plans
        plansRepository.reset()
        verifyPlans()
        verifyDayInitialValue()

        // Check get plan by id
        let id = plansRepository.plans[0].id
        let plan = plansRepository.get(id)
        XCTAssertEqual(plan.name, .basic0to2K)

        let emptyPlan = plansRepository.get(UUID())
        XCTAssertEqual(emptyPlan.name, .basic0to2K)

        // Check get day by id
        let planId = plansRepository.plans[0].id
        let weekId = plansRepository.plans[0].weeks[0].id
        let dayId = plansRepository.plans[0].weeks[0].days[0].id
        let day = plansRepository.getDay(planId, weekId, dayId)
        XCTAssertEqual(day.name, "day")
        XCTAssertEqual(day.orderNumber, "1")
    }
}
