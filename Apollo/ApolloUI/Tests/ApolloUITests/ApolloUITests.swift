import ApolloData
@testable import ApolloUI
import XCTest

final class ApolloUITests: XCTestCase {
    func testPlansViewModel() async {
        let plansViewModel = PlansViewModel()
        XCTAssertEqual(plansViewModel.plans.count, 0)

        await plansViewModel.load()
        XCTAssertEqual(plansViewModel.plans.count, 0)

        plansViewModel.update()
        XCTAssertEqual(plansViewModel.plans.count, 6)

        let planImage = plansViewModel.getImage("0 to 2K")
        XCTAssertNotNil(planImage)
    }

    func testActivityViewModelActiveButton() async {
        let activityViewModel = ActivityViewModel()

        XCTAssertEqual(activityViewModel.timeRemaining, 0)
        XCTAssertEqual(activityViewModel.activeButton, .start)

        activityViewModel.onAppear(day: Day())
        XCTAssertEqual(activityViewModel.activeButton, .start)

        activityViewModel.startPressed()
        XCTAssertEqual(activityViewModel.activeButton, .pause)

        activityViewModel.pausePressed()
        XCTAssertEqual(activityViewModel.activeButton, .resume)

        activityViewModel.resumePressed()
        XCTAssertEqual(activityViewModel.activeButton, .pause)
    }

    func testActivityViewModelFractions() async {
        let plansViewModel = PlansViewModel()
        XCTAssertEqual(plansViewModel.plans.count, 0)

        await plansViewModel.load()
        XCTAssertEqual(plansViewModel.plans.count, 0)

        plansViewModel.update()
        XCTAssertEqual(plansViewModel.plans.count, 6)

        let activityViewModel = ActivityViewModel()

        let day = plansViewModel.plans[0].weeks[0].days[0]
        XCTAssertFalse(day.fractionsCalculated)

        activityViewModel.onAppear(day: day)
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

    func testWeightViewModel() {
        let weightViewModel = WeightViewModel()
        XCTAssertEqual(weightViewModel.bodyMass, "0.0")

        weightViewModel.bodyMass = "95.55555"
        weightViewModel.save()
        weightViewModel.update()
        XCTAssertEqual(weightViewModel.bodyMass, "95.6")

        weightViewModel.bodyMass = "0.0"
        weightViewModel.save()
        weightViewModel.update()
        XCTAssertEqual(weightViewModel.bodyMass, "0.0")
    }
}
