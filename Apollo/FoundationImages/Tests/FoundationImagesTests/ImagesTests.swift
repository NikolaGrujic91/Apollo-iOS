//
//  ImagesTests.swift
//
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FoundationImages
import SwiftUI
import XCTest

final class ImagesTests: XCTestCase, ImagesInjected {
    // MARK: - Properties

    private var imagePlan1: UIImage?
    private var imagePlan2: UIImage?
    private var imagePlan3: UIImage?
    private var imagePlan4: UIImage?
    private var imagePlan5: UIImage?
    private var imagePlan6: UIImage?

    // MARK: Functions

    private func verifyImages() {
        XCTAssertEqual(imagePlan1?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan2?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan3?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan4?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan5?.pngData()?.isEmpty, false)
        XCTAssertEqual(imagePlan6?.pngData()?.isEmpty, false)
    }

    // MARK: - Tests

    @MainActor
    func testImages() {
        imagePlan1 = images.getImage(.plan1)
        imagePlan2 = images.getImage(.plan2)
        imagePlan3 = images.getImage(.plan3)
        imagePlan4 = images.getImage(.plan4)
        imagePlan5 = images.getImage(.plan5)
        imagePlan6 = images.getImage(.plan6)

        verifyImages()
    }

    @MainActor
    func testGifs() {
        let successGif = images.getGif(.success)
        XCTAssertEqual(successGif.isEmpty, false)
    }
}
