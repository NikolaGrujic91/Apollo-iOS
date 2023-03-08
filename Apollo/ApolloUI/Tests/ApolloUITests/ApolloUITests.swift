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

        XCTAssertEqual(day.intervals[0].startFraction, 0.06666666666666667)
        XCTAssertEqual(day.intervals[0].endFraction, 0.0)
        XCTAssertEqual(day.intervals[1].startFraction, 0.16666666666666669)
        XCTAssertEqual(day.intervals[1].endFraction, 0.06666666666666667)
        XCTAssertEqual(day.intervals[2].startFraction, 0.23333333333333336)
        XCTAssertEqual(day.intervals[2].endFraction, 0.16666666666666669)
        XCTAssertEqual(day.intervals[3].startFraction, 0.33333333333333337)
        XCTAssertEqual(day.intervals[3].endFraction, 0.23333333333333336)
        XCTAssertEqual(day.intervals[4].startFraction, 0.4)
        XCTAssertEqual(day.intervals[4].endFraction, 0.33333333333333337)
        XCTAssertEqual(day.intervals[5].startFraction, 0.5)
        XCTAssertEqual(day.intervals[5].endFraction, 0.4)
        XCTAssertEqual(day.intervals[6].startFraction, 0.5666666666666668)
        XCTAssertEqual(day.intervals[6].endFraction, 0.5)
        XCTAssertEqual(day.intervals[7].startFraction, 0.6666666666666667)
        XCTAssertEqual(day.intervals[7].endFraction, 0.5666666666666668)
        XCTAssertEqual(day.intervals[8].startFraction, 0.7333333333333334)
        XCTAssertEqual(day.intervals[8].endFraction, 0.6666666666666667)
        XCTAssertEqual(day.intervals[9].startFraction, 0.8333333333333335)
        XCTAssertEqual(day.intervals[9].endFraction, 0.7333333333333334)
        XCTAssertEqual(day.intervals[10].startFraction, 0.9)
        XCTAssertEqual(day.intervals[10].endFraction, 0.8333333333333335)
        XCTAssertEqual(day.intervals[11].startFraction, 1.0)
        XCTAssertEqual(day.intervals[11].endFraction, 0.9)
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
