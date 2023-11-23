//
//  TDDTests.swift
//  TDDTests
//
//  Created by Israel Manzo on 9/28/23.
//

import XCTest
@testable import TDD

final class TDDTests: XCTestCase {
    
    private var sut: User!
    private var network: Network!

    override func setUpWithError() throws {
        sut = User()
        network = Network()
    }

    override func tearDownWithError() throws {
        sut = nil
        network = nil
    }
    
    func testEmailAddressValidation() {
        let entry = sut.validate(with: "johndoe@g.io", and: "johndoe@g.io")
        XCTAssert(entry, "johndoe@g.io")
    }
    
    func testEmailAddressValidationFailedWithEmptyField() {
        let entry = sut.validate(with: "johndoe@g.io", and: "")
        XCTAssertFalse(entry)
    }
    
    func testUserHasName() {
        let name = sut.user(name: "John", last: "Doe")
        XCTAssertEqual(name, "John Doe")
    }
    
    func testUserEmptyNameOrLastNameFailed() {
        let name = sut.user(name: "John", last: "")
        XCTAssertEqual(name, "John ")
    }
    
    func testUrlIsValid() {
        XCTAssertEqual(network.url.rawValue, "www.google.com")
    }
    
    func testFetchingData() {
        let fetchData = network.fetchData()
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
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
