//
//  KalculatorTests.swift
//  KalculatorTests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest
@testable import Kalculator

final class KalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let app = XCUIApplication()
        //app.launchArguments = ["enable-testing"]
        app.launch()
    }
    
    func PositiveAppendDigit() throws {
        
        let calculator = Calculator()
        
        XCTAssertEqual(try calculator.inputDigit("1"), "1")
        XCTAssertEqual(try calculator.inputDigit("5"), "15")
        XCTAssertEqual(try calculator.inputDigit("6"), "156")
        
        XCTAssertEqual(try calculator.inputDigit("+"), "156")
        
        // does append work after operator is selected?
        XCTAssertEqual(try calculator.inputDigit("3"), "3")
        XCTAssertEqual(try calculator.inputDigit("4"), "34")
        
        calculator.clear()
        
    }
    
    func PositiveOperations() throws{
        
        let calculator = Calculator()
        
        // multiplication
        XCTAssertEqual(try calculator.inputDigit("*"), "120")
        XCTAssertEqual(try calculator.inputDigit("2"), "2")
        XCTAssertEqual(try calculator.inputDigit("="), "240")
        
        // division
        XCTAssertEqual(try calculator.inputDigit("/"), "240")
        XCTAssertEqual(try calculator.inputDigit("1"), "1")
        XCTAssertEqual(try calculator.inputDigit("0"), "10")
        XCTAssertEqual(try calculator.inputDigit("="), "24")
        
        // subtraction
        XCTAssertEqual(try calculator.inputDigit("-"), "24")
        XCTAssertEqual(try calculator.inputDigit("4"), "4")
        XCTAssertEqual(try calculator.inputDigit("="), "20")
        
        // addition
        XCTAssertEqual(try calculator.inputDigit("+"), "20")
        XCTAssertEqual(try calculator.inputDigit("6"), "6")
        XCTAssertEqual(try calculator.inputDigit("8"), "68")
        XCTAssertEqual(try calculator.inputDigit("="), "88")
        
        calculator.clear()
    }
    
    
    func TestDividebyZero() throws {
        
        let calculator = Calculator()
        
        XCTAssertNoThrow(try calculator.inputDigit("2"))
        XCTAssertNoThrow(try calculator.inputDigit("/"))
        XCTAssertNoThrow(try calculator.inputDigit("0"))
        
        XCTAssertThrowsError(try calculator.inputDigit("="), "Can't divide by 0") { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.illegalOperation)
        }
    }
    
    func TestInvalidDigit() throws {
        
        let calculator = Calculator()
        
        XCTAssertThrowsError(try calculator.inputDigit("G"), "Invalid digit") { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.invalidDigit)
        }
    }
    
    
    
    func ClearTest() {
        
        let viewController = ViewController()
        viewController.viewDidLoad()
        
        viewController.clear(self)
        
        XCTAssertEqual(viewController.resultScreen.text, "0")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
