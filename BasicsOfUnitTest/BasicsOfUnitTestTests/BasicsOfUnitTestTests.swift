//
//  BasicsOfUnitTestTests.swift
//  BasicsOfUnitTestTests
//
//  Created by Israel Manzo on 5/1/22.
//

import XCTest
@testable import BasicsOfUnitTest

/// Unit Test runs in alphabetical order - see below
/**
 Running order
 1 -> setUpWithError()
 2 -> testExample()
 3 -> tearDownWithError()
 4 -> testPerformanceExample()
 
 Runing order when custom testing method exist
 1 -> setUpWithError()
 2 -> testA()
 3 -> tearDownWithError()
 */
class BasicsOfUnitTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("1 - Set up with error")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("3 - Tear down with error")
    }
    
    func testB() {
        print("TEST B")
    }
    
    func testA() {
        print("TEST A")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("2 - Test Example")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            print("4 - Test Perform exmaple - measure")
        }
    }

}

/**
 Unit Test Requirement
 Pattern:
 
  func test<System Under Test>_<Condition or State Change>_<Expected Result>() {
        TODO: BODY
  }
 EXAMPLE:
  func testCounter_WhenUserIncreaseDecreaseNumber_NumberShouldNotExcedeEdgeCases()
 */
extension BasicsOfUnitTestTests {
    func testCounter_WhenUserIncreaseDecreaseNumber_NumberShouldNotExcedeEdgeCases() {
        print("Naming convention test function")
    }
}

/**
 AAA
 Arrange - Act - Assert
 
 EXAMPLE:
    Arrange:
        let name = "John Doe"
    Act:
        let username = sut.checkUsername()
    Assert:
        XCTAssertTrue(username, "Extepected TRUE for username or FALSE")
 */
