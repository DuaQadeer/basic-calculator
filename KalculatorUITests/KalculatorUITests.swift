//
//  KalculatorUITests.swift
//  KalculatorUITests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest
@testable import Kalculator

final class KalculatorUITests: XCTestCase {

    var app:XCUIApplication?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func inputDigitTest(){
       // let app = XCUIApplication()
        
    }
    
    func ButtonTest() throws {
        
        // Get all the buttons
        if let buttonslist = app?.buttons{
            for value in 0...9 {
                XCTAssert(buttonslist["\(value)"].exists, "Button \(value) is not available")
            }
            
            XCTAssert(buttonslist["+"].exists, "Operator '+' is not available")
            XCTAssert(buttonslist["-"].exists, "Operator '-' is not available")
            XCTAssert(buttonslist["*"].exists, "Operator '*' is not available")
            XCTAssert(buttonslist["/"].exists, "Operator '/' is not available")
            XCTAssert(buttonslist["="].exists, "Operator '=' is not available")
            XCTAssert(buttonslist["C"].exists, "Clear button 'C' is not available")
            
        }
        
        
    }
    
    
    func PositiveUITest() throws {
        
        app?.buttons["6"].tap()
        app?.buttons["/"].tap()
        app?.buttons["3"].tap()
        app?.buttons["="].tap()
        
        print("Buttons tapped!")
        
        if let labels = app?.staticTexts{
            XCTAssert(labels["Result Screen"].exists)
            XCTAssertEqual(labels["Result Screen"].label, "2")
        }
    }
    
    func NegativeUITest() throws {
        
        app?.buttons["8"].tap()
        app?.buttons["/"].tap()
        app?.buttons["0"].tap()
        app?.buttons["="].tap()
        
        print("Buttons tapped!")
        
        if let labels = app?.staticTexts{
            XCTAssertEqual(labels["Result Screen"].label, "Err")
        }
    }
    

    func testExample() throws {
        
    }

}
