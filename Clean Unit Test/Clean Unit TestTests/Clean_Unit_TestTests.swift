//
//  Clean_Unit_TestTests.swift
//  Clean Unit TestTests
//
//  Created by Israel Manzo on 8/28/25.
//

import XCTest
@testable import Clean_Unit_Test

final class Clean_Unit_TestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Success: The code works correctly with normal input data
    func testContent_shouldReturnCorrectContent_whenPageIsValid() throws {
        let catalog = Catalog(maxPages: 3, content: ["A", "B", "C"])
        let result = try catalog.content(for: 1)
        XCTAssertEqual(result, "B")
    }
    
    // Failure: The code correctly throws an error when content is missing
    func testContent_shouldThrow_whenContentIsMissing() {
        let catalog = Catalog(maxPages: 4, content: ["A", "B", "C"])
        XCTAssertThrowsError(try catalog.content(for: 3)) { error in
            XCTAssertEqual(error as? CatalogError, .missingContent)
        }
    }
    
    // Bottom edge case: The code correctly throws an error with incorrect input data
    func testContent_shouldThrow_whenPageIsNegative() {
        let catalog = Catalog(maxPages: 3, content: ["A", "B", "C"])
        XCTAssertThrowsError(try catalog.content(for: -1)) { error in
            XCTAssertEqual(error as? CatalogError, .invalidPage)
        }
    }
    
    // Top edge case: The code correctly throws an error if we exceed the maximum allowed page number.
    func testContent_shouldThrow_whenPageExceedsMax() {
        let catalog = Catalog(maxPages: 3, content: ["A", "B", "C"])
        XCTAssertThrowsError(try catalog.content(for: 3)) { error in
            XCTAssertEqual(error as? CatalogError, .pageOutOfBounds)
        }
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
