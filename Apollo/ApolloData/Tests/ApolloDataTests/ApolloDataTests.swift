@testable import ApolloData
import XCTest

final class ApolloDataTests: XCTestCase, PlansRepositoryInjected {
    func testMemoryLayout() {
        XCTAssertEqual(class_getInstanceSize(Interval.self), 64)
        XCTAssertEqual(class_getInstanceSize(Plan.self), 56)
        XCTAssertEqual(class_getInstanceSize(Week.self), 56)
        XCTAssertEqual(class_getInstanceSize(Day.self), 96)
    }

    func testPlansRepository() async {
        // Load plans
        await plansRepository.load()
        XCTAssertEqual(plansRepository.plans.count, 6)
        checkPlans()
        checkDayInitialValue()

        // Modify days and calories and save them
        plansRepository.plans[0].weeks[0].days[0].calories = 600
        plansRepository.plans[0].weeks[0].days[0].distance = 6000
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
        XCTAssertEqual(plan1.weeks.count, 6)
        XCTAssertEqual(plan1.weeks[0].days.count, 3)
        XCTAssertEqual(plan1.weeks[1].days.count, 3)
        XCTAssertEqual(plan1.weeks[2].days.count, 3)
        XCTAssertEqual(plan1.weeks[3].days.count, 3)
        XCTAssertEqual(plan1.weeks[4].days.count, 3)
        XCTAssertEqual(plan1.weeks[5].days.count, 1)

        let plan2 = plansRepository.plans[1]
        XCTAssertEqual(plan2.name, "0 to 5K")
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
        XCTAssertEqual(plan3.name, "5K to 10K")
        XCTAssertEqual(plan3.weeks.count, 6)
        XCTAssertEqual(plan3.weeks[0].days.count, 3)
        XCTAssertEqual(plan3.weeks[1].days.count, 3)
        XCTAssertEqual(plan3.weeks[2].days.count, 3)
        XCTAssertEqual(plan3.weeks[3].days.count, 3)
        XCTAssertEqual(plan3.weeks[4].days.count, 3)
        XCTAssertEqual(plan3.weeks[5].days.count, 3)

        let plan4 = plansRepository.plans[3]
        XCTAssertEqual(plan4.name, "Weight Loss: Level 1")
        XCTAssertEqual(plan4.weeks.count, 6)
        XCTAssertEqual(plan4.weeks[0].days.count, 3)
        XCTAssertEqual(plan4.weeks[1].days.count, 3)
        XCTAssertEqual(plan4.weeks[2].days.count, 3)
        XCTAssertEqual(plan4.weeks[3].days.count, 3)
        XCTAssertEqual(plan4.weeks[4].days.count, 3)
        XCTAssertEqual(plan4.weeks[5].days.count, 3)

        let plan5 = plansRepository.plans[4]
        XCTAssertEqual(plan5.name, "Weight Loss: Level 2")
        XCTAssertEqual(plan5.weeks.count, 6)
        XCTAssertEqual(plan5.weeks[0].days.count, 3)
        XCTAssertEqual(plan5.weeks[1].days.count, 3)
        XCTAssertEqual(plan5.weeks[2].days.count, 3)
        XCTAssertEqual(plan5.weeks[3].days.count, 3)
        XCTAssertEqual(plan5.weeks[4].days.count, 3)
        XCTAssertEqual(plan5.weeks[5].days.count, 3)

        let plan6 = plansRepository.plans[5]
        XCTAssertEqual(plan6.name, "Weight Loss: Level 3")
        XCTAssertEqual(plan6.weeks.count, 6)
        XCTAssertEqual(plan6.weeks[0].days.count, 3)
        XCTAssertEqual(plan6.weeks[1].days.count, 3)
        XCTAssertEqual(plan6.weeks[2].days.count, 3)
        XCTAssertEqual(plan6.weeks[3].days.count, 3)
        XCTAssertEqual(plan6.weeks[4].days.count, 3)
        XCTAssertEqual(plan6.weeks[5].days.count, 3)
    }

    func checkDayWithValue() {
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].calories, 600)
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].distance, 6000)
    }

    func checkDayInitialValue() {
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].calories, 0)
        XCTAssertEqual(plansRepository.plans[0].weeks[0].days[0].distance, 0)
    }

    func testIntervalColor() {
        var intervalType: IntervalType = .run
        XCTAssertEqual(intervalType.color(), .blue)

        intervalType = .walk
        XCTAssertEqual(intervalType.color(), .green)

        intervalType = .fastRun
        XCTAssertEqual(intervalType.color(), .yellow)

        intervalType = .fastWalk
        XCTAssertEqual(intervalType.color(), .red)
    }

    func testDay() async {
        // Check there is no plans before loading
        XCTAssertEqual(plansRepository.plans.count, 0)

        // Load plans
        await plansRepository.load()
        XCTAssertEqual(plansRepository.plans.count, 6)

        let day = plansRepository.plans[0].weeks[0].days[0]
        XCTAssertEqual(day.totalTime(), 900)

        XCTAssertEqual(day.intervalType(0), "run")
        XCTAssertEqual(day.intervalType(1), "walk")

        XCTAssertFalse(day.fractionsCalculated)
        day.calculateFractions()
        XCTAssertTrue(day.fractionsCalculated)

        XCTAssertEqual(day.intervals[0].startFraction, 1.0)
        XCTAssertEqual(day.intervals[0].endFraction, 0.9333333333333333)
        XCTAssertEqual(day.intervals[1].startFraction, 0.9333333333333333)
        XCTAssertEqual(day.intervals[1].endFraction, 0.8333333333333334)
        XCTAssertEqual(day.intervals[2].startFraction, 0.8333333333333334)
        XCTAssertEqual(day.intervals[2].endFraction, 0.7666666666666667)
        XCTAssertEqual(day.intervals[3].startFraction, 0.7666666666666667)
        XCTAssertEqual(day.intervals[3].endFraction, 0.6666666666666667)
        XCTAssertEqual(day.intervals[4].startFraction, 0.6666666666666667)
        XCTAssertEqual(day.intervals[4].endFraction, 0.6000000000000001)
        XCTAssertEqual(day.intervals[5].startFraction, 0.6000000000000001)
        XCTAssertEqual(day.intervals[5].endFraction, 0.5000000000000001)
        XCTAssertEqual(day.intervals[6].startFraction, 0.5000000000000001)
        XCTAssertEqual(day.intervals[6].endFraction, 0.43333333333333346)
        XCTAssertEqual(day.intervals[7].startFraction, 0.43333333333333346)
        XCTAssertEqual(day.intervals[7].endFraction, 0.3333333333333335)
        XCTAssertEqual(day.intervals[8].startFraction, 0.3333333333333335)
        XCTAssertEqual(day.intervals[8].endFraction, 0.26666666666666683)
        XCTAssertEqual(day.intervals[9].startFraction, 0.26666666666666683)
        XCTAssertEqual(day.intervals[9].endFraction, 0.16666666666666682)
        XCTAssertEqual(day.intervals[10].startFraction, 0.16666666666666682)
        XCTAssertEqual(day.intervals[10].endFraction, 0.10000000000000016)
        XCTAssertEqual(day.intervals[11].startFraction, 0.10000000000000016)
        XCTAssertEqual(day.intervals[11].endFraction, 0.0)
    }
}
