@testable import ApolloImages
import SwiftUI
import XCTest

final class ApolloImagesTests: XCTestCase, ImagesInjected {
    var imagePlan1: UIImage?
    var imagePlan2: UIImage?
    var imagePlan3: UIImage?
    var imagePlan4: UIImage?
    var imagePlan5: UIImage?
    var imagePlan6: UIImage?

    var successGif: Data?

    func testImages() {
        imagePlan1 = images.getImage(.plan1)
        imagePlan2 = images.getImage(.plan2)
        imagePlan3 = images.getImage(.plan3)
        imagePlan4 = images.getImage(.plan4)
        imagePlan5 = images.getImage(.plan5)
        imagePlan6 = images.getImage(.plan6)

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

    func testGifs() {
        successGif = images.getGif(.success)
        XCTAssertEqual(successGif?.isEmpty, false)
    }
}
