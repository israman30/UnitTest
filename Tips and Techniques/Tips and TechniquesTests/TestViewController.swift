//
//  TestViewController.swift
//  Tips and TechniquesTests
//
//  Created by Israel Manzo on 11/25/23.
//

import XCTest
@testable import Tips_and_Techniques

final class TestViewController: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func test_loading() {
        let sut = CodeBaseViewController(data: "DUMMY DATA")
        // Assert Something
    }
    
    func test_OutletsConnections() {
        let sut = OutletsViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.label, "label")
        XCTAssertNotNil(sut.button, "button")
    }
    
    func test_buttonTapped_WithResult() {
        let sut = OutletsViewController()
        
        sut.tapButton()
        sut.button.sendActions(for: .touchUpInside)
        sut.loadViewIfNeeded()
    }

}
