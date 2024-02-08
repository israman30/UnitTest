//
//  Networking_with_closureTests.swift
//  Networking with closureTests
//
//  Created by Israel Manzo on 2/6/24.
//

import XCTest
@testable import Networking_with_closure

class MockNetworkManager: NetworkProtocol {
    func fetchData(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let mockData = "Mock API Response".data(using: .utf8)
        completion(.success(mockData!))
    }
}

final class Networking_with_closureTests: XCTestCase {
    
    var sut: DataViewModel!

    override func setUpWithError() throws {
        sut = DataViewModel(networkManager: MockNetworkManager())
    }
    
    func test_fetchData() {
        let expectation = XCTestExpectation(description: "Data fetched successfully")
        
        sut.fetchData { result in
            switch result {
            case .success(let data):
                let responseString = String(data: data, encoding: .utf8)
                XCTAssertEqual(responseString, "Mock API Response")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("API call failed with error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    override func tearDownWithError() throws {
        sut = nil
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
