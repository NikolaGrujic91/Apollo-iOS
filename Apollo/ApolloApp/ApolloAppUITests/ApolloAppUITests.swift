//
//  ApolloAppUITests.swift
//  ApolloAppUITests
//
//  Created by Nikola Grujic on 24/07/2023.
//

import XCTest

final class ApolloAppUITests: XCTestCase {
    func testSnapshotMaker() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        snapshot("1. Plans")

        app.collectionViews.staticTexts["Weight Loss: Level 1"].tap()
        snapshot("2. Weeks")

        app.collectionViews.staticTexts["Week 1"].tap()
        snapshot("3. Days")

        app.collectionViews.buttons["Day 1"].tap()
        snapshot("4. Timer")

        //app.alerts["Allow “Apollo” to use your location?"].scrollViews.otherElements.buttons["Allow Once"].tap()
        app.buttons["Play"].tap()
        app.buttons["Pause"].tap()
        snapshot("5. Timer")

        app.navigationBars["Day 1"].buttons["Weight Loss: Level 1"].tap()
        app.tabBars["Tab Bar"].buttons["Settings"].tap()
        snapshot("6. Settings")
    }
}
