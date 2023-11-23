//
//  Tips_and_TechniquesUITests.swift
//  Tips and TechniquesUITests
//
//  Created by Israel Manzo on 11/22/23.
//

import XCTest

/// Choosing the right `Assertion`
/// `XCTAssertEqual(_:_:)            -> Asserts that two values are equal
/// `XCTAssertEqual(_:_:accuracy:)   -> Asserts that two floating-point values are equal within a certain accuracy
/// `XCTAssertNil(_:)                -> Asserts that an optional value is nil
/// `XCTAssertNotNil(_:)             -> Asserts that an optional value is not nil
/// `XCTAssertTrue(_:)               -> Asserts that an expression is true
/// `XCTAssertFalse(_:)              -> Asserts that an expression is false Fails the current test.
/// `XCTFail() F                     -> Fail the current test, You should always provide a descriptive test

final class Tips_and_TechniquesUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    // MARK: - Optional Value
    /// XCTAssertNil failed: "(1 2)"
    func test_asserting_Nil() {
        // This
        let optionalValue: Int? = 123
        XCTAssertNil(optionalValue)
        
        // Same as this
        let objectOptionalValue = SimpleStruct(x: 1, y: 2)
        XCTAssertNil(objectOptionalValue)
    }
    
    // MARK: - Assert Equality
    /// XCTAssertEqual failed: ("message") is not equal to ("actual")
    func test_assertEqual() {
        let message = "message"
        XCTAssertEqual(message, "actual")
    }
    
    // MARK: - Fudge Equality Double and Float
    /// XCTAssertEqual failed: ("0.30000000000000004") is not equal to ("0.3")
    func test_floatingPointDanger() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3)
    }
    
    /// The accuracy parameter gives us a way to express the “more or less” fudge factor. Run this test and you’ll see that it passes.
    func test_floatingPointFixed() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3, accuracy: 0.0001)
    }
}

struct SimpleStruct: CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String { "(\(x) \(y))" }
}
