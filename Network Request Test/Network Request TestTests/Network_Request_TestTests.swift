//
//  Network_Request_TestTests.swift
//  Network Request TestTests
//
//  Created by Israel Manzo on 12/20/22.
//

import XCTest
@testable import Network_Request_Test

final class Network_Request_TestTests: XCTestCase {
    
    var sampleMath: SampleMath!
    
    override func setUp() {
        sampleMath = SampleMath()
    }
    
    override func tearDown() {
        sampleMath = nil
    }
    
    func test_Add_TwoNumbers() {
        // Given
        var result = 0
        // When
        result = sampleMath.add(number: 10)
        // Then
        XCTAssert(result == 20)
        XCTAssertTrue(result == 20)
        XCTAssertFalse(result != 20)
        XCTAssertEqual(result, 20, "The result is this test is correct")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_New_Sample_Test() {
        
    }

}
