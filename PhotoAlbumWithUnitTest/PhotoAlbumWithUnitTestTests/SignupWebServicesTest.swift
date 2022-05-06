//
//  SignupWebServicesTest.swift
//  PhotoAlbumWithUnitTestTests
//
//  Created by Israel Manzo on 5/3/22.
//

import XCTest
@testable import PhotoAlbumWithUnitTest

class SignupWebServicesTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebservices_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebServices(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        let sigupFormRequestModel = SignupFormRequestModel(firstName: "John", lastName: "Doe", email: "johndoe@mail.com", passwrod: "123456")
        
        let expectation = expectation(description: "Signup web services response exepctatino")
        // Act
        sut.signup(withForm: sigupFormRequestModel) { signupResponseModel, error in
            // Assert
            // "{\"status\":"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
    }

}
