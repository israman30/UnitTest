//
//  CalculatorTestTests.swift
//  CalculatorTestTests
//
//  Created by Israel Manzo on 4/28/22.
//

import XCTest
@testable import CalculatorTest

class CalculatorTestTests: XCTestCase {
    
    var sut: Calculations?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Calculations()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testInialCounterNumber() {
        let initialCount = sut?.counter
        XCTAssertEqual(initialCount, 0)
    }
    
    func testIncreaseCounter() {
        let increase = sut?.counter
        let newCount = 0
        XCTAssertEqual(increase, newCount)
    }
    
    func testAddtionResult() {
        let add = sut?.addition(x: 2, y: 2)
        XCTAssertEqual(add, 4)
    }
    
    func testSubtraction() {
        let subs = sut?.subtraction(x: 3, y: 2)
        XCTAssertEqual(subs, 1)
    }
    
    func testIsEmpty() {
        guard let isEmpty = sut?.isEmpty else { return }
        XCTAssertTrue(!isEmpty)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
