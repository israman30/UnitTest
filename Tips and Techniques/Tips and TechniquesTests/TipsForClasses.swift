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
    
    func test_commaSeparated_fromTwoAndFour_shouldReturn234SeparatedByCommas() {
        let result = CoveredClass.commaSeparated(from: 2, to: 4)
        XCTAssertEqual(result, "2,3,4")
    }
    
    func test_commaSeparated_fromTwoAndTwo_shouldReturnSomething() {
        let result = CoveredClass.commaSeparated(from: 2, to: 2)
        XCTAssertEqual(result, "FOO")
    }
    
    func test_area_withWidthSeven_ShouldReturnSomething() {
        let sut = CoveredClass()
        sut.width = 7
        XCTAssertEqual(sut.area, -1)
    }
    
    func test_area_withWidthSeven_ShouldReturnSome49() {
        let sut = CoveredClass()
        sut.width = 7
        XCTAssertEqual(sut.area, 49)
    }

}


