import XCTest
import SwiftUI
@testable import ApolloImages

final class ApolloImagesTests: XCTestCase, PlanImageInjected {
    var imagePlan1: UIImage?
    var imagePlan2: UIImage?
    var imagePlan3: UIImage?
    var imagePlan4: UIImage?
    var imagePlan5: UIImage?
    var imagePlan6: UIImage?

    func testPlanImageManager() {
        imagePlan1 = planImage.getImage(.plan1)
        imagePlan2 = planImage.getImage(.plan2)
        imagePlan3 = planImage.getImage(.plan3)
        imagePlan4 = planImage.getImage(.plan4)
        imagePlan5 = planImage.getImage(.plan5)
        imagePlan6 = planImage.getImage(.plan6)

        compareImages()
    }

    private func compareImages() {
        XCTAssertEqual(imagePlan1?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan2?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan3?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan4?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan5?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan6?.pngData()?.isEmpty, false)
    }
}
