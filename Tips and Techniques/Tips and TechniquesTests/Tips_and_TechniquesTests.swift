//
//  Tips_and_TechniquesTests.swift
//  Tips and TechniquesTests
//
//  Created by Israel Manzo on 11/22/23.
//

import XCTest
@testable import Tips_and_Techniques

/// Choosing the right `Assertion`
/// `XCTAssertEqual(_:_:)            -> Asserts that two values are equal
/// `XCTAssertEqual(_:_:accuracy:)   -> Asserts that two floating-point values are equal within a certain accuracy
/// `XCTAssertNil(_:)                -> Asserts that an optional value is nil
/// `XCTAssertNotNil(_:)             -> Asserts that an optional value is not nil
/// `XCTAssertTrue(_:)               -> Asserts that an expression is true
/// `XCTAssertFalse(_:)              -> Asserts that an expression is false Fails the current test.
/// `XCTFail() F                     -> Fail the current test, You should always provide a descriptive test

final class Tips_and_TechniquesTests: XCTestCase {
    
    private var sut: MyClass!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MyClass()
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    // MARK: - Start from zero
    func test_zero() {
        XCTFail("Start test from zero")
    }
    
    private let sut = MyClass()
    
    func test_methodOne() {
        sut.methodOne()
        XCTFail("Failed")
        // Assert something
    }
    
    func test_methodTwo() {
        sut.methodTwo()
    }

}

// MARK: - Some production object
class MyClass {
    private static var allInstances = 0
    private let instance: Int
    
    init() {
        MyClass.allInstances += 1
        instance = MyClass.allInstances
        print(">> MyClass.init() #\(instance)")
    }
    
    deinit {
        print(">> MyClass.deinit #\(instance)")
    }
    
    func methodOne() {
        print("-> Method One")
    }
    
    func methodTwo() {
        print("-> Method Two")
    }
}

struct SimpleStruct: CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String { "(\(x) \(y))" }
}
