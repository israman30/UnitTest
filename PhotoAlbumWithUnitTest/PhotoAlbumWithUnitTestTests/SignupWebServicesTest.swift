//
//  SignupWebServicesTest.swift
//  PhotoAlbumWithUnitTestTests
//
//  Created by Israel Manzo on 5/3/22.
//

import XCTest
@testable import PhotoAlbumWithUnitTest

class SignupWebServicesTest: XCTestCase {
    
    var sut: SignupWebServices?
    var sigupFormRequestModel: SignupFormRequestModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebServices(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        sigupFormRequestModel = SignupFormRequestModel(firstName: "John", lastName: "Doe", email: "johndoe@mail.com", passwrod: "123456")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        sigupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignupWebservices_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Arrange
        
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = expectation(description: "Signup web services response exepctatino")
        // Act
        sut?.signup(withForm: sigupFormRequestModel!) { signupResponseModel, error in
            // Assert
            // "{\"status\":"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
    }
    
    func testSignupWebservices_WhenReceivedDifferentJSONResponse_ReturnError() {
        // Arrange
        let jsonString = "{\"path\"}:\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = expectation(description: "Signup() method expectaion for a response that contains a different JSON structure")
        // Act
        sut?.signup(withForm: sigupFormRequestModel!) { signupResponseModel, error in
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsinError, "Signup() did not return expected error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSignupWebservices_WhenEmptyURLStringIsProvided_ReturnError() {
        // Arrange
        
        sut = SignupWebServices(urlString: "")
        // Act
        sut?.signup(withForm: sigupFormRequestModel!, completion: { signupRequestModel, error in
            XCTAssertEqual(error, SignupError.invalidRequestURLStringError)
        })
        // Assert
    }

}
