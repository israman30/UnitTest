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
        let sut = SignupWebServices(urlString: "http://appdeveloperblog.com:8080/signup-mock-service/users")
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
