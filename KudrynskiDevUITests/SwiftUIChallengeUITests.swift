//
//  SwiftUIChallengeUITests.swift
//  SwiftUIChallengeUITests
//
//  Created by Wojciech Kudrynski on 26/06/2023.
//

import XCTest

final class SwiftUIChallengeUITests: XCTestCase {
    
    override class func setUp() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    func test_applicationWalkthrough() throws {
        let app = XCUIApplication()
        snapshot("MainViewMe")
        
        let tabBar = app.tabBars["Tab Bar"]
        app.tabBars["Tab Bar"].buttons["CV"].tap()
        app.alerts["Do you want to open this view?"].scrollViews.otherElements.buttons["Show"].tap()
        snapshot("MainViewCV")
        tabBar.buttons["Settings"].tap()
        snapshot("MainViewSettings")
    }

}
