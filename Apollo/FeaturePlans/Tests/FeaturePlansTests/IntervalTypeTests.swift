//
//  IntervalTypeTests.swift
//  
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FeaturePlans
@testable import FoundationLocalization
import XCTest

final class IntervalTypeTests: XCTestCase {
    func testIntervalColor() {
        var intervalType: IntervalType = .run
        XCTAssertEqual(intervalType.color(), .orange.opacity(0.4))

        intervalType = .walk
        XCTAssertEqual(intervalType.color(), .gray.opacity(0.4))

        intervalType = .fastRun
        XCTAssertEqual(intervalType.color(), .red.opacity(0.8))

        intervalType = .fastWalk
        XCTAssertEqual(intervalType.color(), .gray.opacity(0.8))
    }

    @MainActor
    func testRunTranslations() {
        XCTAssertEqual(IntervalType.run.rawValue.localized(.english), "Run")
        XCTAssertEqual(IntervalType.run.rawValue.localized(.german), "Laufen")
        XCTAssertEqual(IntervalType.run.rawValue.localized(.netherlands), "Hardlopen")
        XCTAssertEqual(IntervalType.run.rawValue.localized(.spanish), "Correr")
        XCTAssertEqual(IntervalType.run.rawValue.localized(.portuguese), "Correr")
        XCTAssertEqual(IntervalType.run.rawValue.localized(.french), "Courir")
    }

    @MainActor
    func testWalkTranslations() {
        XCTAssertEqual(IntervalType.walk.rawValue.localized(.english), "Walk")
        XCTAssertEqual(IntervalType.walk.rawValue.localized(.german), "Gehen")
        XCTAssertEqual(IntervalType.walk.rawValue.localized(.netherlands), "Wandelen")
        XCTAssertEqual(IntervalType.walk.rawValue.localized(.spanish), "Caminar")
        XCTAssertEqual(IntervalType.walk.rawValue.localized(.portuguese), "Andar")
        XCTAssertEqual(IntervalType.walk.rawValue.localized(.french), "Marcher")
    }

    @MainActor
    func testFastRunTranslations() {
        XCTAssertEqual(IntervalType.fastRun.rawValue.localized(.english), "Fast run")
        XCTAssertEqual(IntervalType.fastRun.rawValue.localized(.german), "Schneller Lauf")
        XCTAssertEqual(IntervalType.fastRun.rawValue.localized(.netherlands), "Snelle ronde")
        XCTAssertEqual(IntervalType.fastRun.rawValue.localized(.spanish), "Carrera rapida")
        XCTAssertEqual(IntervalType.fastRun.rawValue.localized(.portuguese), "Corrida rápida")
        XCTAssertEqual(IntervalType.fastRun.rawValue.localized(.french), "Course rapide")
    }

    @MainActor
    func testFastWalkTranslations() {
        XCTAssertEqual(IntervalType.fastWalk.rawValue.localized(.english), "Fast walk")
        XCTAssertEqual(IntervalType.fastWalk.rawValue.localized(.german), "Schneller Spaziergang")
        XCTAssertEqual(IntervalType.fastWalk.rawValue.localized(.netherlands), "Snelle pas")
        XCTAssertEqual(IntervalType.fastWalk.rawValue.localized(.spanish), "Paseo rápido")
        XCTAssertEqual(IntervalType.fastWalk.rawValue.localized(.portuguese), "Caminhada rápida")
        XCTAssertEqual(IntervalType.fastWalk.rawValue.localized(.french), "Marche rapide")
    }
}
