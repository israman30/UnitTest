//
//  TipsForClasses.swift
//  Tips and TechniquesTests
//
//  Created by Israel Manzo on 11/23/23.
//

import XCTest
@testable import Tips_and_Techniques

final class TipsForClasses: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_zero() {
        XCTFail("Starting test with failing test")
    }
    
    func test_maxWithOneAndTwo_ShouldReturnSomething() {
        let result = CoveredClass.max(1, 2)
        XCTAssertEqual(result, 2)
    }
    
    func test_maxWithThreeAndTwo_ShouldReturnThree() {
        let result = CoveredClass.max(3, 2)
        XCTAssertEqual(result, 3)
    }
    
    func test_CommaSeparated_fromTwoAndFour_ShouldReturnSomething() {
        let result = CoveredClass.commaSeparated(from: 2, to: 4)
        XCTAssertEqual(result, "FOO")
    }

}


