//
//  Unit_ConverterTests.swift
//  Unit ConverterTests
//
//  Created by Israel Manzo on 6/27/23.
//

import XCTest
@testable import Unit_Converter

final class Unit_ConverterTests: XCTestCase {
    
    var sut: Converters!

    override func setUpWithError() throws {
        sut = Converters()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_converte_resturnsResult() {
        let current = sut.convertEUtoUSD(euro: "10")
        let expected = "$10.80"
        
        XCTAssertEqual(current, expected)
    }
    
    func test_convertNegative_returnSomething() {
        let current = sut.convertEUtoUSD(euro: "-10")
        let expected = "Enter a valid value"
        
        XCTAssertEqual(current, expected)
    }
    
    func test_convertEmptyString_returnErrorMessage() {
        let current = sut.convertEUtoUSD(euro: "")
        let expected = "Enter a valid value"
        XCTAssertEqual(current, expected)
    }
    
    func test_convertLargeValue_returnErrorMessage() {
        let current = sut.convertEUtoUSD(euro: "100000000")
        let expected = "To big value for converting"
        XCTAssertEqual(current, expected)
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
