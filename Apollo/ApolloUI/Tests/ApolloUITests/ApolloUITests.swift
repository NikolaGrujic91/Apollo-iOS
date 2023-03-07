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

    func testActivityViewModel() async {
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
