import XCTest
@testable import ApolloData

final class ApolloDataTests: XCTestCase, PlansRepositoryInjected {
    func testPlansRepository() async {
        // Check there is no plans before loading
        XCTAssertEqual(plansRepository.plans.count, 0)

        // Load plans
        await plansRepository.load()
        XCTAssertEqual(plansRepository.plans.count, 6)
        checkPlans()
        checkDayInitialValue()

        // Modify days and calories and save them
        plansRepository.plans[0].days[0].calories = 600
        plansRepository.plans[0].days[0].distance = 6000
        checkDayWithValue()

        plansRepository.save()
        checkPlans()
        checkDayWithValue()

        // Remove UserDefaults modified plans and restore default plans
        plansRepository.reset()
        checkPlans()
        checkDayInitialValue()
    }

    func checkPlans() {
        let plan1 = plansRepository.plans[0]
        XCTAssertEqual(plan1.name, "0 to 2K")
        XCTAssertEqual(plan1.days.count, 16)

        let plan2 = plansRepository.plans[1]
        XCTAssertEqual(plan2.name, "0 to 5K")
        XCTAssertEqual(plan2.days.count, 24)

        let plan3 = plansRepository.plans[2]
        XCTAssertEqual(plan3.name, "5K to 10K")
        XCTAssertEqual(plan3.days.count, 18)

        let plan4 = plansRepository.plans[3]
        XCTAssertEqual(plan4.name, "Weight Loss: Level 1")
        XCTAssertEqual(plan4.days.count, 18)

        let plan5 = plansRepository.plans[4]
        XCTAssertEqual(plan5.name, "Weight Loss: Level 2")
        XCTAssertEqual(plan5.days.count, 18)

        let plan6 = plansRepository.plans[5]
        XCTAssertEqual(plan6.name, "Weight Loss: Level 3")
        XCTAssertEqual(plan6.days.count, 18)
    }

    func checkDayWithValue() {
        XCTAssertEqual(plansRepository.plans[0].days[0].calories, 600)
        XCTAssertEqual(plansRepository.plans[0].days[0].distance, 6000)
    }

    func checkDayInitialValue() {
        XCTAssertEqual(plansRepository.plans[0].days[0].calories, 0)
        XCTAssertEqual(plansRepository.plans[0].days[0].distance, 0)
    }
}
