//
//  AccountCenterUITests.swift
//  AccountCenterUITests
//
//  Created by Rafael Oliveira on 30/04/22.
//

import XCTest

class AccountCenterUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false

    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let usernameTextField = app.textFields["Username"]
        XCTAssertTrue(usernameTextField.exists)
        
        usernameTextField.tap()
        usernameTextField.typeText("rafael")
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        let button = app.buttons["Continue"]
        XCTAssertTrue(button.exists)
        
        button.tap()
        
        let accountLabel = app.staticTexts["Welcome"]
        XCTAssertTrue(accountLabel.exists)
    
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
