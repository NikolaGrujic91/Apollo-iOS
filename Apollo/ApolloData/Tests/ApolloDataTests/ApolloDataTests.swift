import XCTest
@testable import ApolloData

final class ApolloDataTests: XCTestCase, PlansRepositoryInjected {
    func testPlansRepository() async {
        // Check there is no plans before loading
        XCTAssertEqual(repository.plans.count, 0)

        // Load plans
        await repository.load()
        XCTAssertEqual(repository.plans.count, 6)
        checkPlans()
        checkDayInitialValue()

        // Modify days and calories and save them
        repository.plans[0].days[0].calories = 600
        repository.plans[0].days[0].distance = 6000
        checkDayWithValue()

        XCTAssertTrue(repository.save())
        checkPlans()
        checkDayWithValue()

        // Remove UserDefaults modified plans and restore default plans
        repository.reset()
        checkPlans()
        checkDayInitialValue()
    }

    func checkPlans() {
        let plan1 = repository.plans[0]
        XCTAssertEqual(plan1.name, "0 to 2K")
        XCTAssertEqual(plan1.days.count, 16)

        let plan2 = repository.plans[1]
        XCTAssertEqual(plan2.name, "0 to 5K")
        XCTAssertEqual(plan2.days.count, 24)

        let plan3 = repository.plans[2]
        XCTAssertEqual(plan3.name, "5K to 10K")
        XCTAssertEqual(plan3.days.count, 18)

        let plan4 = repository.plans[3]
        XCTAssertEqual(plan4.name, "Weight Loss: Level 1")
        XCTAssertEqual(plan4.days.count, 18)

        let plan5 = repository.plans[4]
        XCTAssertEqual(plan5.name, "Weight Loss: Level 2")
        XCTAssertEqual(plan5.days.count, 18)

        let plan6 = repository.plans[5]
        XCTAssertEqual(plan6.name, "Weight Loss: Level 3")
        XCTAssertEqual(plan6.days.count, 18)
    }

    func checkDayWithValue() {
        XCTAssertEqual(repository.plans[0].days[0].calories, 600)
        XCTAssertEqual(repository.plans[0].days[0].distance, 6000)
    }

    func checkDayInitialValue() {
        XCTAssertEqual(repository.plans[0].days[0].calories, 0)
        XCTAssertEqual(repository.plans[0].days[0].distance, 0)
    }
}
