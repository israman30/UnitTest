//
//  Login_SystemTests.swift
//  Login SystemTests
//
//  Created by Israel Manzo on 6/29/23.
//

import XCTest
@testable import Login_System

final class Login_SystemTests: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    var mockLoginService: MockLoginService!

    override func setUpWithError() throws {
        mockLoginService = MockLoginService()
        loginViewModel = .init(mockLoginService) // INJECT MOCK LOGIN INTO LOGIN VIEWMODEL
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_LoginWithCorrectDetail_Success() {
        mockLoginService.loginResult = .success(())
        
        loginViewModel.send(.login)
        
        XCTAssertTrue(loginViewModel.successTapped) // tesy should successed because the mock is always true
    }
    
    func test_LoginWith_Failure() {
        mockLoginService.loginResult = .failure(NSError(domain: "", code: -1))
        
        loginViewModel.send(.login)
        
        XCTAssertNotNil(loginViewModel.error)
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
